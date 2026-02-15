using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FitLifeHub
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["FitLifeHubDB"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    // Insert user without specifying Role, database default 'User' will apply
                    string query = "INSERT INTO Users (Username, Email, Password) VALUES (@Username, @Email, @Password)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text); // For production, hash this!

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        lblMessage.Text = "Registration Successful!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
            catch (SqlException ex)
            {
                lblMessage.Text = "Error during registration: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Unexpected error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
