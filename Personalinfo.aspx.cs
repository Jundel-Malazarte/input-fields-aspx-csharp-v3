using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Personalinfo : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["DetailsDBConnectionString"].ConnectionString;

    // A variable to track the currently selected record for updating
    private static int updateId = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDetailsToTable();
        }
    }

    // Handles the logic when the Submit button is clicked (insert or update based on context)
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        string name = Name.Text;
        string address = Address.Text;
        string age = Age.Text;
        string gender = rdoMale.Checked ? "Male" : rdoFemale.Checked ? "Female" : "";

        if (string.IsNullOrEmpty(gender))
        {
            // Optionally display an error message if gender is not selected
            return;
        }

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            if (updateId == -1)  // If no updateId is set, perform insert
            {
                string query = "INSERT INTO details (name, address, age, gender) VALUES (@name, @address, @age, @gender)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@age", age);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.ExecuteNonQuery();
                }
            }
            else  // If updateId is set, perform update
            {
                string query = "UPDATE details SET name = @name, address = @address, age = @age, gender = @gender WHERE id = @id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@age", age);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@id", updateId);
                    cmd.ExecuteNonQuery();
                }
                updateId = -1; // Reset updateId after updating
            }
        }

        BindDetailsToTable();
        ClearFormFields();
    }

    // Method to bind the details from the database to the table (Repeater control)
    private void BindDetailsToTable()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string query = "SELECT id, name, address, age, gender FROM details";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    DetailsRepeater.DataSource = dt;
                    DetailsRepeater.DataBind();
                }
            }
        }
    }

    // Method to clear the form fields after submission
    private void ClearFormFields()
    {
        Name.Text = string.Empty;
        Address.Text = string.Empty;
        Age.Text = string.Empty;
        rdoMale.Checked = false;
        rdoFemale.Checked = false;
    }

    // Handle the Update Button Command: Populate the form fields with the selected record's data
    protected void UpdateRecord(object sender, CommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string query = "SELECT name, address, age, gender FROM details WHERE id = @id";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        // Populate form fields with the selected record's data
                        Name.Text = reader["name"].ToString();
                        Address.Text = reader["address"].ToString();
                        Age.Text = reader["age"].ToString();

                        string gender = reader["gender"].ToString();
                        rdoMale.Checked = gender == "Male";
                        rdoFemale.Checked = gender == "Female";

                        // Set updateId to the selected record's ID
                        updateId = id;
                    }
                }
            }
        }
    }

    // Handle Delete Button Command
    protected void DeleteRecord(object sender, CommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string query = "DELETE FROM details WHERE id = @id";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }
        }

        BindDetailsToTable();
    }
}
