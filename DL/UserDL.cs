
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using Logic.BL;

namespace Logic.DL
{
    public class UserDL
    {

        //---- REGISTRATION -------------------------------------------------------------------------------------------------------------------


        /// Author : Mir Bilal
        ///  21/
        /// Fetch roles (student,Teacher,Admin) for the drop down list in the register page...... 
        /// <returns></returns>
        public static DataTable FetchAllRoles()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                //SqlCommand cmd = new SqlCommand("SELECT * from role ", con);
                //cmd.ExecuteNonQuery();
                SqlCommand cmd = new SqlCommand("SELECT * FROM role where role.roleid != 3", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataTable fetchFeedback()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                //SqlCommand cmd = new SqlCommand("SELECT * from role ", con);
                //cmd.ExecuteNonQuery();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Feedback] order by FeedbackID desc", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : To check wheather a particular email already exists.
        /// </summary>
        public static DataTable FetchEmail(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select email from dbo.[user] where [user].email='" + email + "'", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Description: Submit event fired to insert the newly registered user
  
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public static bool RegisterStudent(string name, string email, int classid, string password, string board, string image)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {

                con.Open();
                string query = "insert into dbo.[user](name,email,classid,limit,password,lock,roleid,board,profileimage)values(@name,@email,'" + classid + "',0,@password,0,1,@board,@image) ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@board", board);
                cmd.Parameters.AddWithValue("@image", image);
                int RowsAffected = cmd.ExecuteNonQuery();


                if (RowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static bool RegisterTeacher(string name, string email, long contact, string password, string subject, string qualification1, string qualification2, string qualification3, string path,string address)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {

                con.Open();
                string query = "insert into dbo.[user](name,email,contact,limit,password,lock,roleid,teacherSubject,qualification1,qualification2,qualification3,profileimage,address)values(@name,@email,'" + contact + "', 0 ,@password,0,1,@subject,@qualification1,@qualification2,@qualification3,@path,@address)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@subject", subject);
                cmd.Parameters.AddWithValue("@qualification1", qualification1);
                cmd.Parameters.AddWithValue("@qualification2", qualification2);
                cmd.Parameters.AddWithValue("@qualification3", qualification3);
                cmd.Parameters.AddWithValue("@path", path);
                cmd.Parameters.AddWithValue("@address", address);
                int RowsAffected = cmd.ExecuteNonQuery();
                if (RowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        public static bool CheckEmailSentToTeacher(string studentemail, string teacheremail)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = "select * from tblcomunication_teach_stu where email='" + studentemail + "' and teacheremail='"+teacheremail+"' and emailflag=true";
                DataSet ds= new DataSet();
                SqlDataAdapter da= new SqlDataAdapter(qry,con);
                da.Fill(ds);
                if(ds.Tables[0].Rows.Count>0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static bool SaveTeacherStudentMessage(string studentname, string studentemail, long contact, string teacheremail, string studentmessage, string grade)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                string query = "insert into tblcomunication_teach_stu(studentname,email,contact,teacheremail,studentmessage,grade,emailflag)values(@studentname,@email,'" + contact + "',@teacheremail,@studentmessage,@grade," + 1 + ") ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@studentname", studentname);
                cmd.Parameters.AddWithValue("@email", studentemail);           
                cmd.Parameters.AddWithValue("@teacheremail", teacheremail);
                cmd.Parameters.AddWithValue("@studentmessage", studentmessage);
                cmd.Parameters.AddWithValue("@grade", grade);
                int RowsAffected = cmd.ExecuteNonQuery();


                if (RowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static bool SaveQuery(string name, string email, string contact, string message)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {

                con.Open();
                string query = "insert into dbo.[Feedback](Name,Email,Contact,Message)values(@name,@email,@contact,@message) ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@contact", contact);
                cmd.Parameters.AddWithValue("@message", message);
                int RowsAffected = cmd.ExecuteNonQuery();


                if (RowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }



        //----- LOGIN ------------------------------------------------------------------------------------------------------------------------



        /// <summary>
        /// Author : Mir Bilal
       
        /// Remarks :
        /// 1. Check wheather the email and password entered by the user to login matches with the email and password in the database.
        /// 2. Also check the limit of the that user , if password matches set its limit to zero .
        /// 3. if password does not match increments the counter....
        /// <param name="password"></param>
        public static DataTable ValidateUser(string email, string password)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {

                con.Open();

                SqlCommand cmd10 = new SqlCommand("select [user].email from [user] where [user].email = '" + email + "'", con);
                string loginemail = (string)cmd10.ExecuteScalar();
                if (loginemail == email)
                {
                    DataSet ds = new DataSet();
                    SqlCommand cmd1 = new SqlCommand("select [user].password from [user] where [user].email = '" + email + "'", con);
                    string pass = (string)cmd1.ExecuteScalar();

                    SqlCommand cmd2 = new SqlCommand("select [user].limit from [user] where [user].email = '" + email + "'", con);
                    int count = (int)cmd2.ExecuteScalar();

                    SqlCommand cmd = new SqlCommand("select [user].roleid from [user] where [user].email ='" + email + "'", con);
                    int role = (int)cmd.ExecuteScalar();

                    if (role == 1 || role == 2)
                    {
                        if (count < 5)
                        {
                            if (pass == password)
                            {

                                SqlCommand cmd3 = new SqlCommand("update [user] set [user].limit = 0 , [user].lock = 0 where [user].email='" + email + "'", con);
                                cmd3.ExecuteNonQuery();
                                SqlCommand cmd4 = new SqlCommand("select [user].email,[user].password,[user].roleid,[user].limit,verification.isvalid  from [user] left outer join dbo.verification on [user].id=verification.UserId where [user].email='" + email + "' and [user].password='" + password + "' and (isvalid=1 or isnull(isvalid,1)=1)", con);
                                cmd4.ExecuteNonQuery();
                                SqlDataAdapter da = new SqlDataAdapter(cmd4);
                                da.Fill(ds);
                                return ds.Tables[0];
                            }
                            else
                            {
                                count = count + 1;
                                SqlCommand cmd5 = new SqlCommand("update [user] set [user].limit = " + count + " where email='" + email + "'", con);
                                cmd5.ExecuteScalar();
                                SqlCommand cmd6 = new SqlCommand("select [user].id,[user].name,[user].email,[user].limit  from [user] where email='" + email + "'", con);
                                cmd6.ExecuteNonQuery();
                                SqlDataAdapter da = new SqlDataAdapter(cmd6);
                                da.Fill(ds);
                                return ds.Tables[0];
                            }
                        }
                        else
                        {
                            SqlCommand cmd7 = new SqlCommand("select [user].id,[user].name,[user].email,[user].limit  from [user] where email='" + email + "'", con);
                            cmd7.ExecuteNonQuery();
                            SqlDataAdapter da = new SqlDataAdapter(cmd7);
                            da.Fill(ds);
                            return ds.Tables[0];
                        }
                    }
                    else
                    {
                        if (pass == password)
                        {

                            SqlCommand cmd4 = new SqlCommand("select [user].email,[user].password,[user].roleid,[user].limit,verification.isvalid  from [user] left outer join dbo.verification on [user].id=verification.UserId where [user].email='" + email + "' and [user].password='" + password + "' and (isvalid=1 or isnull(isvalid,1)=1)", con);
                            cmd4.ExecuteNonQuery();
                            SqlDataAdapter da = new SqlDataAdapter(cmd4);
                            da.Fill(ds);
                            return ds.Tables[0];
                        }
                        else
                        {
                            SqlCommand cmd9 = new SqlCommand("select [user].email,[user].name,[user].roleid,[user].limit  from [user] where email='" + email + "' and [user].password= '" + password + "' ", con);
                            cmd9.ExecuteNonQuery();
                            SqlDataAdapter da = new SqlDataAdapter(cmd9);
                            da.Fill(ds);
                            return ds.Tables[0];
                        }
                    }
                }
                else
                {
                    DataSet ds = new DataSet();
                    SqlCommand cmd4 = new SqlCommand("select [user].email from [user] where [user].email='" + email + "'  ", con);
                    cmd4.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd4);
                    da.Fill(ds);
                    return ds.Tables[0];
                }
            }

            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Set lock attribute of the particular user with the given email to true(1)
        public static void SetLock(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update [user] set [user].lock=1 where [user].email='" + email + "'", con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }



        //--- FORGOT PASSWORD -------------LINKED WITH RESET PASSWORD--------------------LOGIN-------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : To check email of that particular user exists who has forgot his/her password..
        /// <returns></returns>
        public static DataTable Forgotemail(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select [user].email from dbo.[user] where [user].email = '" + email + "'", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : insert random number in the random field of the particular user who clicked on the forgot password link.
        /// </summary>
        public static void InsertRandomNumber(int random, string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                string query = "update  [user] set [user].random=" + random + "where [user].email='" + email + "'";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
  
        /// Remark : insert current date/time into current field of the user in order to check later time limit of the link in the email id of the user  when the link was sent to the user email-id.
        /// </summary>
        public static void InsertDate(string date, string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update [user] set [user].currenttime='" + date + "',[user].duration=24 where [user].email='" + email + "'  ", con);
                //cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }



        //--- RESET PASSWORD--------------------------------------------------LOGIN--------------------------------------------------------------



        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch current time and duration of the link when user clicked forgot password.
        /// </summary>
        public static DataTable FetchDate(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select [user].currenttime,duration from [user] where email='" + email + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : compare given random number with the random number inserted in the random field of the user in the database. 
        /// </summary>
        public static bool CompareRandom(string email, int random)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from [user] where [user].email='" + email + "' and [user].random='" + random + "'", con);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : update old password with newly entered password by the user.
        /// </summary>     
        public static bool UpdatePassword(string email, int random, string password)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update [user] set [user].random= 0,password='" + password + "',[user].limit=0 where email='" + email + "'", con);
                int rowsaffected = cmd.ExecuteNonQuery();
                if (rowsaffected > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }




        //---ADMIN WELCOME---------------------------------------------------ADMIN---------------------------------------------------------       


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch records of all users visible to admin.
        /// </summary>    
        public static DataTable FetchAdminAssets()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select  [user].name , [user].roleid , [user].id ,verification .documents ,verification.subjectid , verification .isvalid  from [user] left outer join verification on [user].id=verification .UserId where (isvalid =0 or  ISNULL (isvalid ,1)=1) and roleid <>3 and roleid <>1", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Update event fired by Administrator to register the teacher.
        /// </summary>
        public static bool UpdateRecord(int id, bool valid, int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                SqlCommand cmd1 = new SqlCommand("update [user] set [user].subjectid = '" + subjectid + "' where [user].id='" + id + "'", con);
                cmd1.ExecuteNonQuery();

                SqlCommand cmd3 = new SqlCommand("update [tblsubject] set tblsubject.userid ='" + id + "' where [tblsubject].subjectid ='" + subjectid + "' ", con);
                cmd3.ExecuteNonQuery();

                SqlCommand cmd = new SqlCommand("update verification set isvalid='" + valid + "' where userid='" + id + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }



        //---BLOCKED USERS---------------------------------------------------ADMIN-------------------------------------------------------        


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch all records of users who made their registration.
        /// </summary>        
        public static DataTable FetchBlockedUsers()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select [user].id ,[user].name ,[user].email ,[user].limit,[user].lock from [user] where [user].limit >=5 ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Insert random number as a temporary password in the password field of the user's account.
        /// </summary>      
        public static void InsertRandomIntoPassWord(int random, string email, int id)
        {

            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {


                string query = "update  [user] set [user].password=" + random + "where [user].email='" + email + "' and [user].id =" + id + " ";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();

            }

            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Blocked users updated by the Admin in order to login back to thier account after temporary locked...
        /// </summary>     
        public static bool UpdateBlockedUsers(int id, int lk, string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update [user] set [user].lock = '" + lk + "' ,[user].limit = 0 where [user].email= '" + email + "' and [user].id='" + id + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                int rowsaffected = cmd.ExecuteNonQuery();
                if (rowsaffected > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }



        //---ACTIVE USERS----------------------------------------------------ADMIN------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch Active users visible to the Admin................
        /// </summary>      
        public static DataTable FetchActiveUsers()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select [user].id ,[user].name ,[user].email ,[user].limit from [user] where [user].limit < 3 ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static bool AddClass(string clas)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into [tblclass](classname)values('" + clas + "' )", con);
                int row = cmd.ExecuteNonQuery();
                if (row > 0)
                {
                    return true;

                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static bool AddSubject(string clas, int classid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into [tblsubject](subjectname,classid)values('" + clas + "'," + classid + " )", con);
                int row = cmd.ExecuteNonQuery();
                if (row > 0)
                {
                    return true;

                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static bool AddChapter(string chapter, int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = "insert into [tbllesson](lessonname,subjectid)values(@chapter," + subjectid + " )";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@chapter", chapter);
                int row = cmd.ExecuteNonQuery();
                if (row > 0)
                {
                    return true;

                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static bool UpdateChapter(string chapter, int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                
                string qry = "update tbllesson set lessonname=@chapter where lessonid='" + subjectid + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@chapter", chapter);
                int row = cmd.ExecuteNonQuery();
                if (row > 0)
                {
                    return true;

                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static bool AddTitle(string title, int lessonid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = "insert into [tbltitle](titlename,lessonid)values(@title," + lessonid + " )";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@title", title);
                int row = cmd.ExecuteNonQuery();
                if (row > 0)
                {
                    return true;

                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static bool UpdateTitle(string title, int titleid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                //string qry = "insert into [tbltitle](titlename,lessonid)values(@title," + lessonid + " )";
                string qry = "update tbltitle set titlename=@titlename where titleid='" + titleid + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@titlename", title);
                int row = cmd.ExecuteNonQuery();
                if (row > 0)
                {
                    return true;

                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }



        //--- PROFILE -------------------------------------------------------STUDENT N TEACHER N ADMIN------------------------------------------------------------


        public static bool UploadPic(string email, string filename)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "update [user] set [user].propic='" + filename + "' where [user].email ='" + email + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception)
            {
                throw;

            }
            finally
            {
                con.Close();
            }
        }



        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark :Fetch profile details of the user(student,teacher,admin)
        /// </summary>
        public static DataTable fetchDetails(string email, int classid, int subjectid)
        {

            SqlConnection con = new SqlConnection(DB.GetConnection());
            DataSet ds = new DataSet();
            try
            {


                con.Open();
                SqlCommand cmd = new SqlCommand("select [user].name , [user].email , [user].dob , [user].address , [user].contact , [user].qualification , [user].skypeid,role.rolename,[user].propic , tblclass.classname,tblsubject.subjectname from [user] left outer join role on [user].roleid = role.roleid  left outer join tblclass on tblclass.classid = [user].classid    left outer join tblsubject on tblsubject.classid= tblclass.classid  where [user].email='" + email + "'and tblclass.classid='" + classid + "' and tblsubject.subjectid='" + subjectid + "' ", con);

                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Update the profile edited by the user
        /// </summary>
        public static bool UpdateUser(string name, string email, string dob, string address, long contact, string qualification, string skypeid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                string query = "update  [user] set name='" + name + "',email='" + email + "',dob='" + dob + "',address='" + address + "',contact=" + contact + ",qualification='" + qualification + "' , skypeid = '" + skypeid + "' where email='" + email + "'";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();

                int retRowsAffected = cmd.ExecuteNonQuery();

                if (retRowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }


        public static bool CheckOldPassword(string password, string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                string query = "select Password from [user] where [user].email = '" + email + "' ";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                string pass = (string)cmd.ExecuteScalar();

                if (pass == password)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static bool ChangePassword(string password, string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {

                string query = "update [user]  set [user].password = '" + password + "' where [user].email= '" + email + "' ";
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                int check = cmd.ExecuteNonQuery();
                if (check > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }




        //--- SUBJECT MATERIAL-----------------------------------------------TEACHER---------------------------------------------------       



        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch type of upload (Audio or Video or Txt or PPT) for the FileUpload of the Teacher.
        ///</summary>
        public static DataTable FetchType()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tbltype ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataTable FetchArticleType()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM articlenews ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataTable FetchArticle()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblarticle order by linkexpiry desc", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataTable FetchArticleNews()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblarticle inner join articlenews on articlenews.typeid=tblarticle.typeid order by linkexpiry desc", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataSet FetchDocumentMaterial()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblmaterial inner join tblclass on tblclass.classid=tblmaterial.classid inner join tblsubject on tblsubject.subjectid=tblmaterial.subjectid inner join tbllesson on tbllesson.lessonid=tblmaterial.lessonid inner join tbltype on tbltype.typeid=tblmaterial.typeid", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();                            
                da.Fill(ds);
             
                return ds;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataSet FetchTeacherProfile(string subject)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select id,name,teacherSubject,profileimage from [user] where teacherSubject=@subject", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@subject", subject);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataSet FetchTeacherFullProfile(int userid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select id,name,email,contact,teacherSubject,profileimage,qualification1,qualification2,qualification3,address from [user] where id='" + userid + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataSet FetchDocumentMaterial1()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();              
               
                SqlCommand cmd = new SqlCommand("select * from tblquestionSyllabus inner join tblclass on tblclass.classid=tblquestionSyllabus.classid inner join tblsubject on tblsubject.subjectid=tblquestionSyllabus.subjectid inner join tbltype on tbltype.typeid=tblquestionSyllabus.typeid", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
               
                return ds;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataSet FetchVidMaterial()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("select * from tblvideomaterial inner join tblclass on tblclass.classid=tblvideomaterial.classid inner join tblsubject on tblsubject.subjectid=tblvideomaterial.subjectid", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                return ds;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }


        public static DataTable FetchArticleID(string title)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT id FROM tblarticle where title='" + title + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static void UpdateArticle(int id)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update tblarticle set status='visited' where id='" + id + "' ", con);
                cmd.ExecuteNonQuery();

               
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch classes for the dropdownlist(class) for which teacher wants to upload the file. .
        /// </summary>
        public static DataTable FetchClass()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.[tblclass]  ", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataTable FetchTutorSubject()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.[tbltutorsubject]  ", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataTable FetchSubject()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.[tblsubject] inner join tblclass on tblclass.classid=tblsubject.classid", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static bool deleteDetail(string query)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }
        public static bool deleteUser(int userid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from verification where userid='" + userid + "'", con);
                SqlCommand cmd2= new SqlCommand("delete from [user] where id='" + userid + "'",con);
                SqlCommand cmd3 = new SqlCommand("delete from [objectiveresult] where userid='" + userid + "'", con);
                SqlCommand cmd4 = new SqlCommand("delete from [answer] where userid='" + userid + "'", con);
                SqlCommand cmd5 = new SqlCommand("delete from [objectiveanswers] where userid='" + userid + "'", con);
                SqlCommand cmd6 = new SqlCommand("delete from [objectiveattendance] where userid='" + userid + "'", con);
                SqlCommand cmd7 = new SqlCommand("delete from [result] where userid='" + userid + "'", con);
                SqlCommand cmd8 = new SqlCommand("delete from [SubmitAssignment] where userid='" + userid + "'", con);
                SqlCommand cmd9 = new SqlCommand("delete from [attendance] where userid='" + userid + "'", con);

                int a = cmd.ExecuteNonQuery();
                int b = cmd2.ExecuteNonQuery();
                int c = cmd3.ExecuteNonQuery();
                int d = cmd4.ExecuteNonQuery();
                int e = cmd5.ExecuteNonQuery();
                int f = cmd6.ExecuteNonQuery();
                int g = cmd7.ExecuteNonQuery();
                int h = cmd8.ExecuteNonQuery();
                int i = cmd9.ExecuteNonQuery();
                          
                      
                if (b > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static bool UpdateDetails(string query)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }
        /// <summary>
        /// Author: Mir Bilal
       
        /// Remark : Fetch subjects for  the dropdownlist of subject (For subjectMaterial in Student  and For ViewMaterial in Teacher)
        /// </summary>
        public static DataTable FetchSubject(int classid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(" select subjectid,subjectname from tblsubject inner join tblclass C on C.classid=tblsubject.classid where [tblsubject].classid='" + classid + "' ", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataTable fetchVideos(string file)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                string query = " select title,filename from tblvideomaterial where filename='" + file + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);
                //if (ds.Tables[0].Rows.Count < 1)
                //{
                //    CreateLog err = new CreateLog();
                //    CreateLog.CreateLogFiles();
                //    err.logFunctionDetails(System.Web.HttpContext.Current.Server.MapPath("/Logs/ErrorLog.txt"),query);
                //}
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataTable FetchLesson(int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.[tbllesson] where [tbllesson].subjectid='" + subjectid + "' ", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataTable FetchLessonName()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.[tbllesson] inner join tblsubject on tblsubject.subjectid=tbllesson.subjectid inner join tblclass on tblclass.classid=tblsubject.classid", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataTable FetchTitle(int lessonid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.[tbltitle] where [tbltitle].lessonid='" + lessonid + "' ", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataTable FetchTitleName()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from dbo.[tbltitle] inner join tbllesson on tbllesson.lessonid=tbltitle.lessonid inner join tblsubject on tblsubject.subjectid=tbllesson.subjectid inner join tblclass on tblclass.classid=tblsubject.classid", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataTable FetchQuestionInformation()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select P.paperid,I.questionid,P.classname,P.subjectname,P.chaptername,I.question,I.answer1,I.answer2 ,I.answer3,I.answer4,I.answerkey,I.image from objectivepaperinformation P inner join objectivequestioninformation I on p.paperid=i.paperid", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataTable FetchExamInformation()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from objectivepaperinformation", con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Store uploaded file of the teacher in the database.
        /// </summary>
        public static bool Material(int typeid, int classid, int subjectid, int lessonid, int filesize, string filename)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = "insert into tblmaterial(typeid,classid,subjectid,lessonid,filesize,[filename]) values('" + typeid + "','" + classid + "','" + subjectid + "','" + lessonid + "','" + filesize + "',@filename)";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@filename", filename);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static bool UpdateMaterial(string fname, int materialid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = qry = "update tblmaterial set filename=@fname where id='" + materialid + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@fname", fname);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static bool VideoMaterial(int typeid, int classid, int subjectid, int lessonid, string filename,string title)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry="insert into tblvideomaterial(typeid,classid,subjectid,lessonid,filename,title) values('" + typeid + "','" + classid + "','" + subjectid + "','" + lessonid + "',@filename,@title)";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@filename", filename);
                cmd.Parameters.AddWithValue("@title", title);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static bool UpdateVideoMaterial(string videoid, string newTitle, int vid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = "update tblvideomaterial set filename=@videoid,title=@newTitle where id='" + vid + "'";

                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@videoid",videoid);
                cmd.Parameters.AddWithValue("@newTitle", newTitle);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static bool QuestionPaperUpload(int typeid, int classid, int subjectid, int filesize, string filename)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry="insert into tblquestionSyllabus(typeid,classid,subjectid,filesize,[filename]) values(" + typeid + "," + classid + "," + subjectid + "," + filesize + ",@filename)";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@filename", filename);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }
        public static bool SyllabusUpload(int typeid, int classid, int subjectid, int filesize, string filename)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = "insert into tblquestionSyllabus(typeid,classid,subjectid,filesize,[filename]) values(" + typeid + "," + classid + "," + subjectid + "," + filesize + ",@filename)";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@filename", filename);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static bool ArticleUpload(string title,int typeid, int filesize, string filename)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                DateTime dt = DateTime.Now;
                dt = dt.Date;
                con.Open();
                string qry = "insert into tblarticle(title,typeid,filesize,filename,linkexpiry,status) values(@title,'" + typeid + "','" + filesize + "',@filename ,'" + dt + "','Latest')";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@filename", filename);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static bool UpdateArticle(string article,int articleid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                DateTime dt = DateTime.Now;
                dt = dt.Date;
                con.Open();
                string qry = "update tblarticle set title=@article where id='" + articleid + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@article", article);             
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }


        //------Notification(Teacher-Welcome)------------------------Teacher-----------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Insert notification of particular teacher for particular department with notifications current date and time...
        /// </summary>
        public static bool InsertNotificationSpecific(string name, string filename, string filepath, string date, int duration, string type)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into notification(name  , filepath , date , filename , duration ,type)values('" + name + "'  , '" + filepath + "' , '" + date + "' , '" + filename + "' , '" + duration + "' , '" + type + "')", con);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static bool InsertNotificationResult(string name, string filename, string date, int duration, string type)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into notification(name  ,  date , filename , duration ,type )values('" + name + "'   , '" + date + "' , '" + filename + "' , '" + duration + "' , '" + type + "')", con);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        //------Student-Welcome(Notifications)----------------------Student-----------------------------------------------------------------------------------------------------------



        public static DataTable FetchWelcomeName(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select [user].name , [user].propic from [user] where [user].email = '" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch name of the teacher who wants to upload his/her notification...
        /// </summary>
        public static DataTable FetchNoticeRoleName(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());

            try
            {


                con.Open();


                SqlCommand cmd = new SqlCommand("select [user].name , [user].classid ,[user].subjectid, [user].id from [user]  where [user].email='" + email + "'", con);
                //SqlCommand cmd = new SqlCommand("select * from [user]", con);
                DataSet ds = new DataSet();
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }
        public static DataTable FetchNoticeRoleName1()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());

            try
            {


                con.Open();


               // SqlCommand cmd = new SqlCommand("select [user].name , [user].classid ,[user].subjectid, [user].id from [user]  where [user].email='" + email + "'", con);
                SqlCommand cmd = new SqlCommand("select * from [user]", con);
                DataSet ds = new DataSet();
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// /// Remark : Fetch notifications and current date and time of all notifications...
        /// </summary>
        public static DataTable FetchNotificationAndDate()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(" select * from notification ", con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }

            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }




        //------Evaluate-Assignment-------------------------------Teacher---------------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch all assignments uploaded by the students...
        /// </summary>
        public static DataTable Fetchassignment(int classid, int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                string query = "select SubmitAssignment.id , SubmitAssignment.assignmentid ,[user].name , [tblclass].classname , SubmitAssignment.[filename] , SubmitAssignment.[status]  FROM  [SubmitAssignment]  INNER JOIN [user] ON [user].id= [SubmitAssignment].userid   inner join tblclass on tblclass.classid = [user].classid   where [SubmitAssignment].subjectid='" + subjectid + "' and SubmitAssignment.classid='" + classid + "'";

                SqlCommand cmd = new SqlCommand(query, con);



                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Update remark field (attribute) of assignment table tp indicate accept and reject of assignments submmited by the students...
        /// </summary>
        public static bool UpdateNotificationRemark(int ide, bool status)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update SubmitAssignment set SubmitAssignment.status='" + status + "' where [SubmitAssignment].id='" + ide + "' ", con);
                cmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        //--- VIEW MATERIAL-------------------------------------------------STUDENT-----------------------------------------------------------------------------------------



        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark :
        /// </summary>
        public static DataTable Fetchmaterialdetails(int classid, int subjectid,int lessonid, int typeid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                //string query = "select  [tblclass].classname, [tblsubject].subjectname, [tbltype].type, [tblmaterial].filename FROM  [tblclass] INNER JOIN [tblsubject] ON [tblclass].classid = [tblsubject].classid INNER JOIN [tblmaterial] ON [tblsubject].subjectid = [tblmaterial].subjectid INNER JOIN [tbltype] ON [tblmaterial].typeid = [tbltype].typeid where [tblmaterial].subjectid='" + subjectid + "' and tblmaterial.typeid='" + typeid + "'";
                string query = " select filename from tblmaterial where classid= '"+classid +"' and subjectid = '"+subjectid +"' and lessonid='"+lessonid+"' and typeid='"+typeid +"'";
                SqlCommand cmd = new SqlCommand(query, con);



                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        public static DataTable FetchVideomaterialdetails(int classid, int subjectid, int lessonid, int typeid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                string query = " select title,filename from tblvideomaterial where classid= '" + classid + "' and subjectid = '" + subjectid + "' and lessonid='" + lessonid + "' and typeid='" + typeid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);                
              
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        public static DataTable FetchQuestionPapers(int classid, int subjectid, int typeid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                //string query = "select  [tblclass].classname, [tblsubject].subjectname, [tbltype].type, [tblmaterial].filename FROM  [tblclass] INNER JOIN [tblsubject] ON [tblclass].classid = [tblsubject].classid INNER JOIN [tblmaterial] ON [tblsubject].subjectid = [tblmaterial].subjectid INNER JOIN [tbltype] ON [tblmaterial].typeid = [tbltype].typeid where [tblmaterial].subjectid='" + subjectid + "' and tblmaterial.typeid='" + typeid + "'";
                string query = " select filename from tblquestionSyllabus where classid= '" + classid + "' and subjectid = '" + subjectid + "' and typeid='" + typeid + "'";
                SqlCommand cmd = new SqlCommand(query, con);



                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        public static DataTable FetchFetchSyllabus(int classid, int subjectid, int typeid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                //string query = "select  [tblclass].classname, [tblsubject].subjectname, [tbltype].type, [tblmaterial].filename FROM  [tblclass] INNER JOIN [tblsubject] ON [tblclass].classid = [tblsubject].classid INNER JOIN [tblmaterial] ON [tblsubject].subjectid = [tblmaterial].subjectid INNER JOIN [tbltype] ON [tblmaterial].typeid = [tbltype].typeid where [tblmaterial].subjectid='" + subjectid + "' and tblmaterial.typeid='" + typeid + "'";
                string query = " select filename from tblquestionSyllabus where classid= '" + classid + "' and subjectid = '" + subjectid + "' and typeid='" + typeid + "'";
                SqlCommand cmd = new SqlCommand(query, con);



                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }


        //-----Assignment------------------------------------------Student-----------------------------------------------------------------------------------------------------        

        public static bool AssignAssignment(string TeacherName, string AssignmentName, int classid, int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "insert into AssignAssignment ( teachername , classid , subjectid , assignmentname)values('" + TeacherName + "' , '" + classid + "' , '" + subjectid + "' , '" + AssignmentName + "')";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        public static DataTable FetchAssignAssignment(int classid, int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select assignmentid , teachername , assignmentname  from AssignAssignment where AssignAssignment.classid = '" + classid + "' and AssignAssignment.subjectid = '" + subjectid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static DataTable AlreadySubmitAssignment(int userid, int classid, int subjectid, int assignmentid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select SubmitAssignment.userid from SubmitAssignment where SubmitAssignment.userid='" + userid + "' and SubmitAssignment.classid='" + classid + "' and SubmitAssignment.subjectid='" + subjectid + "' and SubmitAssignment.assignmentid='" + assignmentid + "' and SubmitAssignment.remark= 1 ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Reamrk : Insert the assignment submitted by particular student in the database...
        /// </summary>     
        public static bool UploadAssignment(int userid, int classid, int subjectid, string filename, string assignmentname, int assignmentid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "insert into SubmitAssignment(userid,classid,subjectid,[filename],assignmentname,assignmentid,remark , status) values( '" + userid + "' , '" + classid + "' , '" + subjectid + "' , '" + filename + "' , '" + assignmentname + "' , '" + assignmentid + "' , 1 ,0)";
                SqlCommand cmd = new SqlCommand(query, con);
                int c = cmd.ExecuteNonQuery();
                if (c > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }



        //---- set Theory paper----------------------------------------------------Teacher-------------------------------------------------------------------------------------------

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : insert paper information of particular subject in paperinformation table.
        /// </summary>     
        public static bool InsertPaperInfo(string classname, string subjectname, int papertime, int papermarks, int passmarks)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "insert into paperinformation (classname,subbjectname,papertime,papermarks,passmarks)values('" + classname + "' , '" + subjectname + "' , '" + papertime + "', '" + papermarks + "' , '" + passmarks + "')";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = cmd.ExecuteNonQuery();

                if (count > 0)
                    return true;
                else
                    return false;

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch paperid (e.g  JAVA) for which teacher wants to set question for examination....
        /// </summary>    
        public static DataTable FetchPaperId(string classname, string subjectname)
        {

            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select paperid from paperinformation where paperinformation.classname='" + classname + "' and paperinformation.subbjectname='" + subjectname + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark :  fetch Questionid (to check marks utilized per question) for theory-examination...
        /// </summary>
        public static DataTable FetchTheoryPaperQuestionId(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select MAX(questionid) as questionid from questoninformation where questoninformation.paperid= '" + paperid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark :  fetch marks-utilized per question for examination to check if all papers has been utilized by the teacher...
        /// </summary>
        public static DataTable FetchTheoryMarksUtilized(int questionid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select marksstatus from questoninformation where questoninformation.questionid= '" + questionid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Insert questions set by the teacher for particular subject for examination....
        /// </summary>
        public static bool SetQuestion(string quesno, string question, string ans, string marks, int paperid, int marksleft)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "insert into questoninformation (quesno,question,answer,marks,paperid,marksstatus) values ('" + quesno + "' , '" + question + "' , '" + ans + "' , '" + marks + "' , '" + paperid + "' , '" + marksleft + "')";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = cmd.ExecuteNonQuery();

                if (count > 0)
                    return true;
                else
                    return false;

            }

            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch paper information to view paper set for the examination (View button click)
        /// </summary>
        public static DataTable ViewPaperInfo(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select classname,subbjectname,papertime,papermarks,passmarks from paperinformation  where  paperinformation.paperid='" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : To view questions set for particular paper  (View button click)
        /// </summary>
        public static DataTable ViewQuestion(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select quesno,question,marks from  questoninformation inner join paperinformation on paperinformation.paperid =questoninformation.paperid where paperinformation.paperid='" + paperid + "'  ";

                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Delete paper-information and questions set for the examination for particular subject...  
        /// </summary>
        public static bool DeletePapers(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query1 = "delete from paperinformation where paperinformation.paperid='" + paperid + "' ";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                int count1 = cmd1.ExecuteNonQuery();

                if (count1 > 0)
                    return true;
                else
                    return false;

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        //------Examination-Theory Paper-------------------------------------------------------Student-----------------------------------------------------------------------------------

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch remark to check wheather particular student has already submitted their answers for the Questions of particular subject....
        /// </summary>
        public static DataTable FetchTheoryRemark(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select remark from result where result.userid = '" + userid + "' and result.paperid = '" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch paper-information for the examination set by the teacher....
        /// </summary>
        public static DataTable FetchPaperInfo(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select classname,subbjectname,papertime,papermarks,passmarks from paperinformation where paperinformation.paperid='" + paperid + "'  ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch all Questions of particular subject set by the teacher for the examination...
        /// </summary>     
        public static DataTable FetchQuestion(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select questionid , quesno , question , marks from   questoninformation inner join paperinformation on paperinformation.paperid =questoninformation.paperid where paperinformation.paperid='" + paperid + "' ";

                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Fetch user-id of the particular student....
        /// </summary>
        public static DataTable UserId(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select id,name from [user] where [user].email ='" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }
        public static DataTable getAnsInfo(int userid,int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select * from objectiveanswers O inner join objectivequestioninformation I on O.paperid=I.paperid and O.questionid=I.questionid  where O.paperid='" + paperid + "' and O.userid='" + userid + "' and O.answer !=''";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static DataTable getAttemptedQuestions(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select count(O.questionid) from objectiveanswers O inner join objectivequestioninformation I on O.paperid=I.paperid and O.questionid=I.questionid  where O.paperid='" + paperid + "' and O.userid='" + userid + "' and O.answer !=''";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static DataTable getWrongAnsweredQuestions(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select count(O.questionid) from objectiveanswers O inner join objectivequestioninformation I on O.paperid=I.paperid and O.questionid=I.questionid  where O.paperid='" + paperid + "' and O.userid='" + userid + "' and O.answer !='' and O.marksobtained=0";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static DataTable getCorrectAnsweredQuestions(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select count(O.questionid) from objectiveanswers O inner join objectivequestioninformation I on O.paperid=I.paperid and O.questionid=I.questionid  where O.paperid='" + paperid + "' and O.userid='" + userid + "' and O.answer !='' and O.marksobtained=1";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Insert student's name in attendance table in order to indicate his/her presence in examination...
        /// </summary>
        public static void InsertAttendance(int paperid, string name, int userid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "insert into attendance (paperid , name , userid )values('" + paperid + "' , '" + name + "' , '" + userid + "')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Insert answers of particular student for the questions set by the teacher for examinations of particular subject.......
        /// </summary>
        public static void InsertAnswer(string answer, int questionid, int paperid, int userid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "insert into answer(answer,questionid,paperid,userid)values('" + answer + "' , '" + questionid + "' , '" + paperid + "' , '" + userid + "' )";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        public static DataTable FetchClassname(int classid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select classname from tblclass where [tblclass].classid ='" + classid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }


        public static DataTable FetchSubjectname(int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select subjectname from tblsubject where [tblsubject].subjectid ='" + subjectid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static void SubmitPaperRemark(int userid, string classname, string subjectname, int paperid)
        {

            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "insert into result (userid , classname , subjectname ,paperid , remark , remark1)values('" + userid + "' , '" + classname + "' , '" + subjectname + "' , '" + paperid + "' , 1 , 0)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

            }

            catch (Exception)
            {
                throw;
            }


            finally
            {
                con.Close();
            }
        }


        //------Evaluate-Theory-Papers-----------------------------------------------------------Teacher-------------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch names of appeared students in the examination in particular subject ...
        /// </summary>
        public static DataTable FetchAppearedStudents(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select name,userid from attendance where attendance.paperid = '" + paperid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch answers of particular student for the questions set in the examination for evaluation(checking).....
        /// </summary>
        public static DataTable FetchAnswers(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select  [questoninformation].quesno ,[answer].answer  from answer inner join questoninformation on answer.questionid = questoninformation.questionid where answer.paperid = '" + paperid + "' and answer.userid ='" + userid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Check wheather the answer-paper of particular student is already checked....
        /// </summary>
        public static DataTable AlreadyChecked(int userid , int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select remark1 from result where result.userid = '" + userid + "' and result.paperid = '"+paperid+"' ";
                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark :  Stores marks of the answers entered by the teacher...
        /// </summary>
        public static void InsertMarks(string strValue, int questionid, int paperid, int userid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "update answer set marks ='" + strValue + "' where answer.questionid = '" + questionid + "' and answer.paperid = '" + paperid + "' and answer.userid = '" + userid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch all marks of the answers  of the student...
        /// </summary>
        public static DataTable FetchMarks(int paperid, int userid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select marks from answer where answer.paperid= '" + paperid + "' and answer.userid = '" + userid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Generate result of particular student...
        /// </summary>
        public static bool GenerateResult(int userid, string classname, string subjectname, int marksobtained, string result, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                //string query = "update result set marksobtained =  '" + marksobtained + "' , result =  '" + result + "' , remark1 = 1 where result.userid='" + userid + "' and result.paperid='" + paperid + "' ";
                string query = "insert into result (userid,classname,subjectname,marksobtained,result,paperid,remark1)values('" + userid + "' , '" + classname + "','" + subjectname + "','" + marksobtained + "','" + result + "','" + paperid + "',1)";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }




        //------Theory-Result-----------------------------------------------------------Student--------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch result of student based on name...
        /// </summary>
        //public static DataTable ViewResultName(string name, int paperid)
        //{
        //    SqlConnection con = new SqlConnection(DB.GetConnection());
        //    try
        //    {
        //        con.Open();
        //        string query = "select [user].name,[result].userid,[result].classname,[result].subjectname,[result].marksobtained,[result].result from [result] inner join [user] on [result].userid = [user].id where [user].name='" + name + "' and [result].paperid ='" + paperid + "'";
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        cmd.ExecuteNonQuery();
        //        DataSet ds = new DataSet();
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        da.Fill(ds);
        //        return ds.Tables[0];
        //    }
        //    catch (Exception)
        //    {
       
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //}
        public static DataTable ViewResultName(string email, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select [user].name,[objectiveresult].userid,[objectiveresult].classname,[objectiveresult].subjectname,[objectiveresult].chaptername,[objectiveresult].percentage,[objectiveresult].result from [objectiveresult] inner join [user] on [objectiveresult].userid = [user].id where [user].email='" + email + "' and [objectiveresult].paperid ='" + paperid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Fetch result of student based on user-ID...
        /// </summary>
        public static DataTable ViewResultID(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select [user].name,[result].userid,[result].classname,[result].subjectname,[result].marksobtained,[result].result from [result] inner join [user] on [result].userid = [user].id where [user].id='" + userid + "' and [result].paperid ='" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Fetch result of all students of particular class and subject...
        /// </summary>
        public static DataTable ViewFullResult(string classname, string subjectname, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select [user].name,[result].marksobtained,[result].result ,[result].remark1 from [result] inner join [user] on [result].userid = [user].id where [result].classname ='" + classname + "' and [result].subjectname = '" + subjectname + "' and [result].paperid ='" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }


        //----Set Objective Paper----------------------------------------------Teacher--------------------------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark :  Inserts Objectivepaperinformation for examination
        /// </summary>        
        public static bool InsertObjectivePaperInfo(string classname, string subjectname,string chaptername)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                DataTable q = FindQuestionInfo(classname, subjectname, chaptername);
                if (q.Rows.Count > 0)
                    return true;
                else
                {
                    string query = "insert into objectivepaperinformation (classname,subjectname,chaptername)values(@classname , @subjectname ,@chaptername)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@classname", classname);
                    cmd.Parameters.AddWithValue("@subjectname", subjectname);
                    cmd.Parameters.AddWithValue("@chaptername", chaptername);
                    int count = cmd.ExecuteNonQuery();

                    if (count > 0)
                        return true;
                    else
                        return false;
                }
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        public static bool UpdateObjectivepaper(string papermarks, string passmarks, int pid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                string qry = "update objectivepaperinformation set papermarks=@papermarks,passmarks=@passmarks where paperid='" + pid + "'";
                    SqlCommand cmd = new SqlCommand(qry, con);
                    cmd.Parameters.AddWithValue("@papermarks", papermarks);
                    cmd.Parameters.AddWithValue("@passmarks",passmarks);
                    int count = cmd.ExecuteNonQuery();
                    if (count > 0)
                        return true;
                    else
                        return false;               
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        private static DataTable FindQuestionInfo( string classname,string subjectname,string  chaptername)
        {
            string qry = "select paperid from objectivepaperinformation where classname='" + classname + "' and subjectname='" + subjectname + "' and chaptername='" + chaptername + "'";
            SqlConnection con = new SqlConnection(DB.GetConnection());
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];
        }
        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch objective-paperid (e.g  JAVA) for which teacher wants to set objective-question for examination....
        /// </summary>    
        public static DataTable FetchObjectivePaperId(string classname, string subjectname,string chaptername)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select paperid from objectivepaperinformation where objectivepaperinformation.classname='" + classname + "' and objectivepaperinformation.subjectname='" + subjectname + "' and objectivepaperinformation.chaptername='"+chaptername+"'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark :  fetch Objective-Questionid (to check marks utilized per question) for examination...
        /// </summary>
        public static DataTable FetchQuestionId(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select MAX(questionid) as questionid from objectivequestioninformation where objectivequestioninformation.paperid= '" + paperid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark :  fetch marks-utilized per question for examination to check if all papers has been utilized by the teacher...
        /// </summary>
        public static DataTable FetchMarksUtilized(int questionid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select marksstatus from objectivequestioninformation where objectivequestioninformation.questionid= '" + questionid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Insert objective-questions set by the teacher for particular subject for examination....
        /// </summary>
        public static bool SetObjectiveQuestion(string quesno, string question, string ans1, string ans2, string ans3, string ans4, string anskey,  int paperid,int marks, string image)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "insert into objectivequestioninformation (quesno,question,answer1,answer2,answer3,answer4,answerkey,paperid,marks,image) values (@quesno , @question , @ans1 ,@ans2 , @ans3, @ans4 , @anskey , '" + paperid + "','" + marks + "' ,'" + image + "')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@quesno", quesno);
                cmd.Parameters.AddWithValue("@question", question);
                cmd.Parameters.AddWithValue("@ans1", ans1);
                cmd.Parameters.AddWithValue("@ans2", ans2);
                cmd.Parameters.AddWithValue("@ans3", ans3);
                cmd.Parameters.AddWithValue("@ans4", ans4);
                cmd.Parameters.AddWithValue("@anskey", anskey);              
                int count = cmd.ExecuteNonQuery();

                if (count > 0)
                    return true;
                else
                    return false;

            }

            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        public static bool UpdateObjectiveQuestion(string question, string ans1, string ans2, string ans3, string ans4, string anskey,int questionid ,int pid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "update objectivequestioninformation  set question=@question,answer1=@ans1,answer2=@ans2,answer3=@ans3,answer4=@ans4,answerkey=@anskey where questionid='" + questionid + "' and paperid='" + pid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@question", question);
                cmd.Parameters.AddWithValue("@ans1", ans1);
                cmd.Parameters.AddWithValue("@ans2", ans2);
                cmd.Parameters.AddWithValue("@ans3", ans3);
                cmd.Parameters.AddWithValue("@ans4", ans4);
                cmd.Parameters.AddWithValue("@anskey", anskey);
                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                    return true;
                else
                    return false;

            }

            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch Objective-paper-information to view paper set for the examination (View button click)
        /// </summary>
        public static DataTable ViewObjectivePaperInfo(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select classname,subjectname,chaptername,papermarks,papertime,passmarks from objectivepaperinformation  where  objectivepaperinformation.paperid='" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : To view objective-questions set for particular paper  (View button click)
        /// </summary>
        public static DataTable ViewObjectiveQuestion(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select quesno,question,marks,image,answer1,answer2,answer3,answer4 from  objectivequestioninformation inner join objectivepaperinformation on objectivepaperinformation.paperid = objectivequestioninformation.paperid where objectivepaperinformation.paperid='" + paperid + "'  ";

                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Delete objective-paper-information and objectve-questions set for the examination for particular subject...  
        /// </summary>
        public static bool DeleteObjectivePapers(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query1 = "delete from objectivepaperinformation where objectivepaperinformation.paperid='" + paperid + "' ";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                int count1 = cmd1.ExecuteNonQuery();

                string query2 = "delete from objectivequestioninformation where objectivequestioninformation.paperid='" + paperid + "' ";
                SqlCommand cmd2 = new SqlCommand(query2, con);
                int count2 = cmd2.ExecuteNonQuery();

                if (count1 > 0 && count2 > 0)
                    return true;
                else
                    return false;

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }




        //----Examination-Objective Paper---------------------------------------------Student----------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch remark to check wheather particular student has already submitted their answers for the Questions of particular subject....
        /// </summary>
        public static DataTable FetchRemark(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select remark from objectiveresult where objectiveresult.userid = '" + userid + "' and objectiveresult.paperid = '" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch Objective-paper-information for the examination set by the teacher....
        /// </summary>
        public static DataTable FetchObjectivePaperInfo(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select classname,subjectname,chaptername,papermarks,passmarks from objectivepaperinformation where objectivepaperinformation.paperid='" + paperid + "'  ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public static DataTable getCount(int paperid,int userid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select count(paperid) from objectiveanswers where paperid='" + paperid + "' and userid='" + userid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Fetch all Questions of particular subject set by the teacher for the examination...
        /// </summary>     
        public static DataTable FetchObjectiveQuestion(int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select questionid , quesno , question , marks , answer1 , answer2 , answer3 , answer4 , answerkey,image from   objectivequestioninformation inner join objectivepaperinformation on objectivepaperinformation.paperid = objectivequestioninformation.paperid where objectivepaperinformation.paperid='" + paperid + "' ";

                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
               
                return ds.Tables[0];
              
                


            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Fetch user-id of the particular student....
        /// </summary>
        public static DataTable UsrId(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();

                string query = "select id,name from [user] where [user].email ='" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Insert student's name in attendance table in order to indicate his/her presence in examination...
        /// </summary>
        public static void InsertObjectivePaperAttendance(int paperid, string name, int userid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = "select paperid from objectiveattendance where userid='"+userid+"' and paperid='" + paperid + "'";
                SqlCommand cm = new SqlCommand(qry, con);
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count<1)
                { 
                    string query = "insert into objectiveattendance (paperid , name , userid )values('" + paperid + "' , '" + name + "' , '" + userid + "')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Insert answers and marks of particular objective question by comparing it with a answer-key stored in answer table of particular student for the questions set by the teacher for examinations of particular subject.......
        /// </summary>
        public static void InsertObjectiveAnswer(string answer, int questionid, int paperid, int userid, int marks, string anskey)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = "select questionid from objectiveanswers where questionid='" + questionid + "' and paperid= '" + paperid + "'and userid='" + userid + "'";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count>0)
                {
                    string delqry="delete from objectiveanswers where questionid='" + questionid + "' and paperid= '" + paperid + "'and userid='" + userid + "'";
                    SqlCommand cm= new SqlCommand(delqry,con);
                    cm.ExecuteNonQuery();
                }
                    string query = "insert into objectiveanswers(answer,questionid,paperid,userid,marks,answerkey)values('" + answer + "' , '" + questionid + "' , '" + paperid + "' , '" + userid + "' , '" + marks + "' , '" + anskey + "')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    int count = cmd.ExecuteNonQuery();
                    if (answer == anskey)
                    {
                        string query1 = "update objectiveanswers set marksobtained = '" + marks + "' where  objectiveanswers.questionid = '" + questionid + "' and  objectiveanswers.userid='" + userid + "'";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.ExecuteNonQuery();
                    }
                    else
                    {
                        string query1 = "update objectiveanswers set marksobtained = 0  where  objectiveanswers.questionid = '" + questionid + "' and  objectiveanswers.userid='" + userid + "'";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.ExecuteNonQuery();
                    }
              
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        public static void UpdateObjectiveAnswer(string answer, int questionid, int paperid, int userid, int marks, string anskey)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "update objectiveanswers set answer='" + answer + "',questionid='" + questionid + "' ,marks= '" + marks + "' ,answerkey='" + anskey + "' where  paperid='" + paperid + "' and userid= '" + userid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = cmd.ExecuteNonQuery();
                if (answer == anskey)
                {
                    string query1 = "update objectiveanswers set marksobtained = '" + marks + "' where  objectiveanswers.questionid = '" + questionid + "' and  objectiveanswers.userid='" + userid + "'";
                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    cmd1.ExecuteNonQuery();
                }
                else
                {
                    string query1 = "update objectiveanswers set marksobtained = 0  where  objectiveanswers.questionid = '" + questionid + "' and  objectiveanswers.userid='" + userid + "'";
                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    cmd1.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        //-------Objective Result(Objective-examination)--------------------Student-----------------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
        
        /// Remark : Fetch Marks-secured for each objective question by particular student in corresponding subject...
        /// </summary>
        public static DataTable FetchObjectiveMarks(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select marksobtained from objectiveanswers  where objectiveanswers.userid='" + userid + "' and objectiveanswers.paperid = '" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
        
        /// Remark : Insert total marks and percentage and generates result by summing up all secured-marks of particular student in corresponding subject...
        /// </summary>
        public static void GenerateObjectiveResult(int userid, string classname, string subjectname,string chaptername, int total, decimal percent, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string qry = "select paperid from objectiveresult where userid='" + userid + "' and paperid='" + paperid + "'";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count < 1)
                {
                    string query = "insert into objectiveresult (userid,classname,subjectname,chaptername,Totalmarks,percentage , paperid , remark) values ('" + userid + "' , '" + classname + "' , '" + subjectname + "' ,'" + chaptername + "', '" + total + "' , '" + percent + "' , '" + paperid + "' , 1)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    if (percent > 40)
                    {
                        string query1 = "update objectiveresult set result = 'Pass'  ";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.ExecuteNonQuery();
                    }
                    else
                    {
                        string query1 = "update objectiveresult set result = 'Fail' ";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.ExecuteNonQuery();
                    }
                }
                else
                {
                    string query = "update objectiveresult set classname='" + classname + "' ,subjectname='" + subjectname + "',chaptername='" + chaptername + "',Totalmarks='" + total + "',percentage='" + percent + "'  ,remark=1 where userid ='" + userid + "' and paperid='" + paperid + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    if (percent > 40)
                    {
                        string query1 = "update objectiveresult set result = 'Pass'  ";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.ExecuteNonQuery();
                    }
                    else
                    {
                        string query1 = "update objectiveresult set result = 'Fail' ";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.ExecuteNonQuery();
                    }
                
                }
               
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public static void DeletePreviousObjectiveResult(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "delete from objectiveresult where userid='" + userid + "' and paperid='" + paperid + "'";
                //string query = "insert into objectiveresult (userid,classname,subjectname,Totalmarks,percentage , paperid , remark) values ('" + userid + "' , '" + classname + "' , '" + subjectname + "' , '" + total + "' , '" + percent + "' , '" + paperid + "' , 1)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
              
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
        
        /// Remark : Fetch objective-result of student based on name...
        /// </summary>
        public static DataTable ObjectiveViewResultName(string name, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select [user].name , [objectiveresult].userid , [objectiveresult].classname , [objectiveresult].subjectname , [objectiveresult].Totalmarks , [objectiveresult].percentage , [objectiveresult].result from [objectiveresult] inner join [user] on [objectiveresult].userid = [user].id   where [user].name='" + name + "' and objectiveresult.paperid = '" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
        
        /// Remark : Fetch result of student based on user-ID...
        /// </summary>
        public static DataTable ObjectiveViewResultID(int userid, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select [user].name,[objectiveresult].userid,[objectiveresult].classname,[objectiveresult].subjectname,[objectiveresult].Totalmarks,[objectiveresult].percentage,[objectiveresult].result from [objectiveresult] inner join [user] on [objectiveresult].userid = [user].id where [user].id='" + userid + "' and objectiveresult.paperid = '" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Author : Mir Bilal
        
        /// Remark : Fetch objective-result of all students of particular class and subject...
        /// </summary>
        public static DataTable ObjectiveViewFullResult(string classname, string subjectname, int paperid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select [user].name , [objectiveresult].Totalmarks ,[objectiveresult].percentage , [objectiveresult].result from [objectiveresult] inner join [user] on [objectiveresult].userid = [user].id where [objectiveresult].classname ='" + classname + "' and [objectiveresult].subjectname = '" + subjectname + "' and [objectiveresult].paperid = '" + paperid + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }




        //-----Skype----------------------------------------------------------------------------------------------------------------------------------------------------------------------

        public static DataTable OnlineClass(int classid, int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select skypeid from [user] where classid ='" + classid + "' and subjectid='" + subjectid + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }


        }

        public static DataTable FetchStudent(int classid, int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select id,name from [user] where [user].classid = '" + classid + "' and [user].subjectid='" + subjectid + "' and [user].roleid=1";
                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static DataTable FetchStudentSkypeId(int id)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select skypeid from [user] where [user].id='" + id + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }


        }

        public static DataTable FetchTeacher(int classid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select id,name from [user] where [user].classid = '" + classid + "' and [user].roleid=2";
                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        public static DataTable FetchUser(int classid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select id,name from [user] where [user].classid = '" + classid + "'and [user].roleid=2";
                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds.Tables[0];

            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------

        public static bool CheckValidUser(int classid, string email, int subjectid)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select classid from [user] where [user].email = '" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int clas = (int)cmd.ExecuteScalar();
                string query1 = "select subjectid from [user] where [user].email = '" + email + "'";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                int subject = (int)cmd1.ExecuteScalar();
                if (clas == classid && subject == subjectid)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }
        public static bool CheckUser(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select email from [user] where [user].email = '" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                string mail = (string)cmd.ExecuteScalar();
                if (mail==email)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        public static bool CheckStudent(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select roleid from [user] where [user].email = '" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int role= (int)cmd.ExecuteScalar();
               
                if (role==2)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }
        public static bool CheckAdmin(string email)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select roleid from [user] where [user].email = '" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int role = (int)cmd.ExecuteScalar();

                if (role == 3)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        public static bool CheckQuestionInfoEntry(string classname, string subjectname, string chaptername)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {
                con.Open();
                string query = "select classname,subjectname,chaptername from objectivepaperinformation where classname='" + classname + "' and subjectname='" + subjectname + "' and chaptername='" + chaptername + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count>0)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }

        }

        /// Author : Mir Bilal
        /// insert pages when application starts from glibal.asax and checks already existing files..........
        /// </summary>
        /// <param name="fileList"></param>
        public static void InsertFiles(List<string> fileList)
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {

                con.Open();

                string query = "select pagenames.pagename from pagenames";
                SqlCommand cmd = new SqlCommand(query, con);


                DataSet ds = new DataSet();
                cmd.ExecuteNonQuery();
                int i;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (i = 0; i < fileList.Count; i++)
                    {
                        string pagename = fileList[i].ToString();
                        string queryWhere = "select pagenames.pagename from pagenames where pagenames.pagename='" + pagename + "' ";
                        SqlCommand cmdWhere = new SqlCommand(queryWhere, con);


                        DataSet dsWhere = new DataSet();
                        cmdWhere.ExecuteNonQuery();

                        SqlDataAdapter daWhere = new SqlDataAdapter(cmdWhere);
                        daWhere.Fill(dsWhere);
                        if (dsWhere.Tables[0].Rows.Count <= 0)
                        {
                            SqlCommand cmdInsert = new SqlCommand("insert into [pagenames](pagename) values ('" + fileList[i] + "') ", con);
                            cmdInsert.ExecuteNonQuery();
                        }

                    }

                }
                else
                {
                    for (i = 0; i < fileList.Count; i++)
                    {
                        SqlCommand cmd1 = new SqlCommand("insert into [pagenames](pagename) values ('" + fileList[i] + "') ", con);
                        cmd1.ExecuteNonQuery();
                    }
                }

            }

            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }

        /// Author : Mir Bilal
        /// count number of pages for glibal.asax
        /// </summary>
        /// <returns></returns>
        public static int getpagecount()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {

                con.Open();

                string query = "select COUNT(pageid) from pagenames";
                SqlCommand cmd = new SqlCommand(query, con);


                DataSet ds = new DataSet();
                int count = Convert.ToInt32(cmd.ExecuteScalar());

                return count;
            }

            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }


        /// Author : Mir Bilal
        ///  From Admin : Permission link............
        /// </summary>
        /// <returns></returns>
        /// 
        public static DataTable getpages()
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {

                con.Open();
                DataSet ds = new DataSet();
                string query = "select [pagenames].pagename from pagenames ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);


                da.Fill(ds);
                return ds.Tables[0];


            }

            catch (Exception)
            {
                throw;
            }

            finally
            {
                con.Close();
            }
        }


        /// Author : Mir Bilal
        /// privileges added by the admin for the roles by giving permission which role can access which particular pages.....
        /// </summary>
        /// <param name="pagename"></param>
        /// <param name="roleid"></param>
        public static bool addprivileges(string pagename, int roleid)        // stored procedure
        {
            SqlConnection con = new SqlConnection(DB.GetConnection());

            try
            {
                con.Open();
                string query1 = "select pageid from pagenames where pagenames.pagename = '" + pagename + "'";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                int id = (int)cmd1.ExecuteScalar();
                string query2 = "insert into pagenumber(roleid,pageid)values('" + roleid + "' , '" + id + "')";
                SqlCommand cmd2 = new SqlCommand(query2, con);
                int count = cmd2.ExecuteNonQuery();
                if (count > 0)
                    return true;
                else
                    return false;

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }

        }

        /// Author : Mir Bilal
        ///  1/6/2014
        /// fetch page names to which the particular user with the particular email has access.... 
        /// <param name="email"></param>
        /// <returns></returns>
        public static DataTable FetchUserPrivileges(int roleid)
        {
            //fetch all user privileges

            SqlConnection con = new SqlConnection(DB.GetConnection());
            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand(" select [pagenames].pagename from [pagenumber] inner join [pagenames] on [pagenumber].pageid = [pagenames].pageid  where [pagenumber].roleid='" + roleid + "'", con);
                //     SqlCommand cmd = new SqlCommand(" select [pagenames].pagename from [user] inner join [pagenumber] on [user].roleid = [pagenumber].roleid inner join [pagenames] on [pagenumber].pageid=[pagenames].pageid where [user].roleid='" + roleid + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }


    }

}

