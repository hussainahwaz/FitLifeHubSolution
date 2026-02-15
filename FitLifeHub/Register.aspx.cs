using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitLifeHub
{
    public partial class Register : System.Web.UI.Page
    {
        // Get connection string from Web.config
        private string connectionString = ConfigurationManager.ConnectionStrings["FitLifeHubConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initialization code here
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Check if page is valid
            if (Page.IsValid)
            {
                try
                {
                    // Validate password strength
                    if (!IsPasswordStrong(txtPassword.Text))
                    {
                        ShowMessage("Password must be at least 8 characters and include uppercase, lowercase, number, and special character.", "danger");
                        return;
                    }

                    // Check if username already exists
                    if (UsernameExists(txtUsername.Text))
                    {
                        ShowMessage("Username already exists. Please choose a different username.", "danger");
                        return;
                    }

                    // Check if email already exists
                    if (EmailExists(txtEmail.Text))
                    {
                        ShowMessage("Email already registered. Please use a different email or <a href='Login.aspx'>login here</a>.", "danger");
                        return;
                    }

                    // Hash the password
                    string passwordHash = HashPassword(txtPassword.Text);

                    // Insert user into database
                    bool success = InsertUser(passwordHash);

                    if (success)
                    {
                        ShowMessage("Registration successful! Redirecting to login...", "success");

                        // Redirect to login page after 2 seconds
                        Response.AddHeader("REFRESH", "2;URL=Login.aspx");
                    }
                    else
                    {
                        ShowMessage("Registration failed. Please try again.", "danger");
                    }
                }
                catch (Exception ex)
                {
                    // Log the error (in production, use proper logging)
                    ShowMessage("An error occurred: " + ex.Message, "danger");
                }
            }
        }

        /// <summary>
        /// Validates that the terms and conditions checkbox is checked
        /// </summary>
        protected void ValidateTerms(object source, ServerValidateEventArgs args)
        {
            args.IsValid = chkTerms.Checked;
        }

        /// <summary>
        /// Checks if username already exists in database
        /// </summary>
        private bool UsernameExists(string username)
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        /// <summary>
        /// Checks if email already exists in database
        /// </summary>
        private bool EmailExists(string email)
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        /// <summary>
        /// Validates password strength
        /// </summary>
        private bool IsPasswordStrong(string password)
        {
            // At least 8 characters
            if (password.Length < 8)
                return false;

            // Contains uppercase letter
            if (!Regex.IsMatch(password, @"[A-Z]"))
                return false;

            // Contains lowercase letter
            if (!Regex.IsMatch(password, @"[a-z]"))
                return false;

            // Contains digit
            if (!Regex.IsMatch(password, @"[0-9]"))
                return false;

            // Contains special character
            if (!Regex.IsMatch(password, @"[^A-Za-z0-9]"))
                return false;

            return true;
        }

        /// <summary>
        /// Hashes password using SHA256 with salt
        /// In production, consider using BCrypt or Argon2
        /// </summary>
        private string HashPassword(string password)
        {
            // Generate a random salt
            byte[] saltBytes = new byte[32];
            using (var rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(saltBytes);
            }
            string salt = Convert.ToBase64String(saltBytes);

            // Combine password and salt
            string saltedPassword = password + salt;

            // Hash the salted password
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] passwordBytes = Encoding.UTF8.GetBytes(saltedPassword);
                byte[] hashBytes = sha256.ComputeHash(passwordBytes);
                string hash = Convert.ToBase64String(hashBytes);

                // Return salt + hash (separated by colon)
                return salt + ":" + hash;
            }
        }

        /// <summary>
        /// Inserts new user into database
        /// </summary>
        private bool InsertUser(string passwordHash)
        {
            string query = @"
                INSERT INTO Users (
                    Username, 
                    Email, 
                    PasswordHash, 
                    FullName, 
                    DateOfBirth, 
                    Gender, 
                    PhoneNumber, 
                    FitnessLevel, 
                    FitnessGoal, 
                    Height, 
                    Weight, 
                    UserRole, 
                    IsActive, 
                    CreatedDate
                ) VALUES (
                    @Username, 
                    @Email, 
                    @PasswordHash, 
                    @FullName, 
                    @DateOfBirth, 
                    @Gender, 
                    @PhoneNumber, 
                    @FitnessLevel, 
                    @FitnessGoal, 
                    @Height, 
                    @Weight, 
                    'User', 
                    1, 
                    GETDATE()
                )";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Add parameters - Required fields
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);
                    cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());

                    // Add parameters - Optional fields (handle null/empty values)
                    cmd.Parameters.AddWithValue("@DateOfBirth",
                        string.IsNullOrWhiteSpace(txtDateOfBirth.Text)
                        ? (object)DBNull.Value
                        : DateTime.Parse(txtDateOfBirth.Text));

                    cmd.Parameters.AddWithValue("@Gender",
                        string.IsNullOrWhiteSpace(ddlGender.SelectedValue)
                        ? (object)DBNull.Value
                        : ddlGender.SelectedValue);

                    cmd.Parameters.AddWithValue("@PhoneNumber",
                        string.IsNullOrWhiteSpace(txtPhoneNumber.Text)
                        ? (object)DBNull.Value
                        : txtPhoneNumber.Text.Trim());

                    cmd.Parameters.AddWithValue("@FitnessLevel",
                        string.IsNullOrWhiteSpace(ddlFitnessLevel.SelectedValue)
                        ? (object)DBNull.Value
                        : ddlFitnessLevel.SelectedValue);

                    cmd.Parameters.AddWithValue("@FitnessGoal",
                        string.IsNullOrWhiteSpace(ddlFitnessGoal.SelectedValue)
                        ? (object)DBNull.Value
                        : ddlFitnessGoal.SelectedValue);

                    cmd.Parameters.AddWithValue("@Height",
                        string.IsNullOrWhiteSpace(txtHeight.Text)
                        ? (object)DBNull.Value
                        : decimal.Parse(txtHeight.Text));

                    cmd.Parameters.AddWithValue("@Weight",
                        string.IsNullOrWhiteSpace(txtWeight.Text)
                        ? (object)DBNull.Value
                        : decimal.Parse(txtWeight.Text));

                    try
                    {
                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                    catch (SqlException ex)
                    {
                        // Log the error
                        System.Diagnostics.Debug.WriteLine("SQL Error: " + ex.Message);
                        return false;
                    }
                }
            }
        }

        /// <summary>
        /// Shows a message to the user
        /// </summary>
        private void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = message;

            // Remove existing alert classes
            pnlMessage.CssClass = "alert";

            // Add appropriate alert class based on type
            switch (type.ToLower())
            {
                case "success":
                    pnlMessage.CssClass += " alert-success";
                    break;
                case "danger":
                case "error":
                    pnlMessage.CssClass += " alert-danger";
                    break;
                case "warning":
                    pnlMessage.CssClass += " alert-warning";
                    break;
                default:
                    pnlMessage.CssClass += " alert-info";
                    break;
            }
        }
    }
}
