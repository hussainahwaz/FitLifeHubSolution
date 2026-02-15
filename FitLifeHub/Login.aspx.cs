using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace FitLifeHub
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is already logged in
                if (Session["UserID"] != null)
                {
                    RedirectUserBasedOnRole();
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text;

                try
                {
                    // Authenticate user
                    var user = AuthenticateUser(email, password);

                    if (user != null)
                    {
                        // Successful login
                        Session["UserID"] = user.UserID;
                        Session["Username"] = user.Username;
                        Session["Email"] = user.Email;
                        Session["UserRole"] = user.UserRole;
                        Session["FullName"] = user.FullName;

                        // Update last login date
                        UpdateLastLogin(user.UserID);

                        // Set authentication cookie if "Remember Me" is checked
                        if (chkRememberMe.Checked)
                        {
                            FormsAuthentication.SetAuthCookie(user.Email, true);
                        }

                        // Show success message
                        ShowMessage("Login successful! Redirecting...", "success");

                        // Redirect based on user role
                        RedirectUserBasedOnRole();
                    }
                    else
                    {
                        // Invalid credentials
                        ShowMessage("Invalid email or password. Please try again.", "error");
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("An error occurred: " + ex.Message, "error");
                }
            }
        }

        private UserInfo AuthenticateUser(string email, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FitLifeHubDB"].ConnectionString;
            string hashedPassword = HashPassword(password);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT UserID, Username, Email, FullName, UserRole, IsActive 
                                FROM Users 
                                WHERE Email = @Email AND PasswordHash = @PasswordHash";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Check if account is active
                            if (!(bool)reader["IsActive"])
                            {
                                ShowMessage("Your account has been suspended. Please contact support.", "error");
                                return null;
                            }

                            return new UserInfo
                            {
                                UserID = (int)reader["UserID"],
                                Username = reader["Username"].ToString(),
                                Email = reader["Email"].ToString(),
                                FullName = reader["FullName"] != DBNull.Value ? reader["FullName"].ToString() : "",
                                UserRole = reader["UserRole"].ToString()
                            };
                        }
                    }
                }
            }

            return null;
        }

        private void UpdateLastLogin(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FitLifeHubDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Users SET LastLoginDate = GETDATE() WHERE UserID = @UserID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void RedirectUserBasedOnRole()
        {
            if (Session["UserRole"] != null)
            {
                string role = Session["UserRole"].ToString();

                switch (role)
                {
                    case "Admin":
                        Response.Redirect("AdminDashboard.aspx");
                        break;
                    case "Trainer":
                        Response.Redirect("TrainerDashboard.aspx");
                        break;
                    case "User":
                    default:
                        Response.Redirect("UserDashboard.aspx");
                        break;
                }
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                // Use the same salt as registration
                string saltedPassword = password + "FitLifeHub2026";
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(saltedPassword));

                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "message show " + type;

            if (type == "success")
            {
                // Redirect after 2 seconds for success
                Response.AddHeader("REFRESH", "2;");
            }
        }

        // Helper class to store user information
        private class UserInfo
        {
            public int UserID { get; set; }
            public string Username { get; set; }
            public string Email { get; set; }
            public string FullName { get; set; }
            public string UserRole { get; set; }
        }
    }
}
