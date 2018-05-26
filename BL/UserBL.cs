
using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using Logic.DL;
using System.Data;

namespace Logic.BL
{

    public class UserBL
    {

        //--- REGISTRATION ------------------------------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
       /// Remark : : Fetch all roles for the dropdown list (User) in the Register Page...
        /// <returns></returns>
        public static DataTable FetchAllRoles()
        {
            return UserDL.FetchAllRoles();
        }

        public static DataTable fetchFeedback()
        {
            return UserDL.fetchFeedback();
        }
        
        /// /// <summary>
        /// Author : Bhat javid

        /// Remark : Call to fetch Data of Student For the Student Profile.... 
        /// <returns></returns>
        public static DataTable FetchStudata(string StEmail)
        {
            return UserDL.FetchStudata(StEmail);
        }
        /// <summary>
        /// Author : Mir Bilal 

        /// Remark : Call to fetch email to check wheather a particular user with the particular email exists.. 
        /// <returns></returns>
        public static bool Fetchemail(string email)
        {
            if (UserDL.FetchEmail(email).Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public static bool SaveTeacherStudentMessage(string studentname,string studentemail,long contact,string teacheremail,string studentmessage,string grade)
        {
            return UserDL.SaveTeacherStudentMessage(studentname, studentemail, contact, teacheremail, studentmessage, grade);
        }
        public static bool CheckEmailSentToTeacher(string studentemail,string teacheremail)
        {
            return UserDL.CheckEmailSentToTeacher(studentemail, teacheremail);
        }
        /// <summary>
        /// Author : Mir Bilal
  
        ///  Remarks : Description: Submit event fired to insert the newly registered user.
        /// </summary>
        /// </summary>
        public static bool RegisterStudent(string name, string email, int classid, string password,string board,string image)
        {
            string encryptpass = Encrypt.EncryptPassword(password);
            return UserDL.RegisterStudent(name, email,classid, encryptpass,board,image);
        }

        public static bool RegisterTeacher(string name, string email, long contact, string password, string subject, string qualification1, string qualification2, string qualification3, string path)
        {
            string encryptpass = Encrypt.EncryptPassword(password);
            return UserDL.RegisterTeacher(name, email, contact, encryptpass, subject, qualification1, qualification2, qualification3, path);
        }

        public static bool SaveQuery(string name, string email, string contact,string message)
        {
           return UserDL.SaveQuery(name, email, contact , message);
        }

        //---- LOGIN  ------------------------------------------------------------------------------------------------------------------------



        /// <summary>
        /// Author : Mir Bilal
     
        /// Remarks : 
        /// 1. First calls the encrypt class to encrypt the password to be stored in the database.
        /// 2. calls the validate method in DL with the encrypt password for login.
        /// <returns></returns>
        public static DataTable ValidateUser(string Email, string password)
        {
            string encryptpass = Encrypt.EncryptPassword(password);
            DataTable ds = UserDL.ValidateUser(Email, encryptpass);
            return ds;
        }

        /// <summary>
        /// Author : Mir Bilal
    
        /// Remark : Call SetLock method to set the Lock of the User.
        /// </summary>
        public static void SetLock(string email)
        {
            UserDL.SetLock(email);
        }
        //-------Update Profile-------------------------------------------------------------

        /// <summary>
        /// Author : Bhat Javid

        ///  Remarks : Description: Submit event fired to Update Profile Of Existing Users.
        /// </summary>

        public static bool UpdateStudent(string name, string Contact, int classid, string password, string board, string image,string Email)
        {
            string encryptpass = Encrypt.EncryptPassword(password);
            return UserDL.UpdateStudent(name,Contact, classid, encryptpass, board, image,Email);
        }
        //---- FORGOT PASSWORD ---------------------------------------------------------------------------------------------------------


        /// <summary>
        ///Author : Mir Bilal
       
        /// Remark : Call to check email of that particular user exists who has forgot his/her password..
        /// <returns>bool</returns>
        public static bool Forgotemail(string email)
        {
            if (UserDL.FetchEmail(email).Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to insert random number in the random field of the particular who clicked on the forgot password link.
        /// </summary>
        public static void InsertRandomNumber(int random, string email)
        {
            UserDL.InsertRandomNumber(random, email);
        }


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Call to insert current date/time into current field of the user in order to check later time limit of the link in the email id of the user  when the link was sent to the user email-id.
        /// </summary>
        public static void InsertDate(string date, string email)
        {
            UserDL.InsertDate(date, email);
        }



        //--- RESET PASSWORD ------------------------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Call to current time and duration of the link
        /// </summary>
        public static DataTable FetchDate(string email)
        {
            return UserDL.FetchDate(email);
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to compare 2 random numbers.
        /// </summary>
        public static bool CompareRandom(string email, int random)
        {
            return UserDL.CompareRandom(email, random);
        }

        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to update the password.
        /// </summary>
        public static bool UpdatePassword(string email, int random, string password)
        {
            string encryptpass = Encrypt.EncryptPassword(password);
            return UserDL.UpdatePassword(email, random, encryptpass);
        }




        //----ADMIN WELCOME------------------------------ADMIN---------------------------------------------------------------------------------        


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Event fired to fetch all the records visibe to admin for updation
        /// </summary>
        public static DataTable FetchAdminAssets()
        {
            return UserDL.FetchAdminAssets();
        }


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Update event fired by admin in order to register the teacher.
        /// </summary>
        public static bool UpdateRecord(int id, bool valid, int subjectid)
        {
            return UserDL.UpdateRecord(id, valid, subjectid);
        }


        //----BLOCKED USERS------------------------------------ADMIN---------------------------------------------------------------------------        


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Event driven by admin to fetch blocked users
        /// </summary>
        public static DataTable FetchBlockedUsers()
        {
            return UserDL.FetchBlockedUsers();

        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Event driven by administrator to insert random number in blocked users random field.
        /// </summary>
        public static void InsertRandomIntoPassWord(int random, string email, int id)
        {
            UserDL.InsertRandomIntoPassWord(random, email, id);
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Event driven by admin to update blocked users lock field.
        /// </summary>
        public static bool UpdateBlockedUsers(int id, int lk, string email)
        {
            return UserDL.UpdateBlockedUsers(id, lk, email);
        }


        //----ACTIVE USERS--------------------------------------ADMIN-----------------------------------------------------------------------------

        /// <summary>
        /// Author : Mir Bilal
        
        /// Remark : Event driven by the administrator to fetch active users.
        /// </summary>
        public static DataTable FetchActiveUsers()
        {
            return UserDL.FetchActiveUsers();
        }

        public static bool AddClass(string clas)
        {
            return UserDL.AddClass(clas);
        }


        public static bool AddSubject(string clas, int classid)
        {
            return UserDL.AddSubject(clas, classid);
        }

        public static bool AddChapter(string chapter, int subjectid)
        {
            return UserDL.AddChapter(chapter, subjectid);
        }

        public static bool UpdateChapter(string chapter, int subjectid)
        {
            return UserDL.UpdateChapter(chapter, subjectid);
        }

        public static bool AddTitle(string title, int lessonid)
        {
            return UserDL.AddTitle(title, lessonid);
        }

        public static bool UpdateTitle(string title, int titleid)
        {
            return UserDL.UpdateTitle(title, titleid);
        }
        //--- PROFILE ---------------------------------------STUDENT N TEACHER N ADMIN------------------------------------------------------------------------------


        public static bool UploadPic(string email, string filename)
        {
            return UserDL.UploadPic(email, filename);
        }

        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to Fetch the details of the user in order to update their profile...
        /// </summary>
        public static DataTable fetchDetails(string email, int classid, int subjectid)
        {
            DataTable dtDetails = UserDL.fetchDetails(email, classid, subjectid);
            return dtDetails;
        }


        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to upadate the profile of the user
        /// </summary>
        public static bool UpdateUser(string name, string email, string dob, string address, long contact, string qualification, string skypeid)
        {
            // string encryptpass = Encrypt.EncryptPassword(password);
            return UserDL.UpdateUser(name, email, dob, address, contact, qualification, skypeid);
        }


        public static bool CheckOldPassword(string password, string email)
        {
            string encryptpass = Encrypt.EncryptPassword(password);
            return UserDL.CheckOldPassword(encryptpass, email);
        }

        public static bool ChangePassword(string password, string email)
        {
            string encryptpass = Encrypt.EncryptPassword(password);
            return UserDL.ChangePassword(encryptpass, email);
        }



        //--- SUBJECT MATERIAL-----------------------------------------TEACHER-----------------------------------------------------------------



        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Call to fetch the type of file uploaded by the teacher.
        /// </summary>
        public static DataTable FetchType()
        {
            return UserDL.FetchType();
        }

        public static DataTable FetchArticleType()
        {
            return UserDL.FetchArticleType();
        }

        public static DataTable FetchArticle()
        {
            return UserDL.FetchArticle();
        }
        public static DataTable FetchArticleNews()
        {
            return UserDL.FetchArticleNews();
        }

        public static DataSet FetchDocumentMaterial()
        {
            return UserDL.FetchDocumentMaterial();
        }
        public static DataSet FetchTeacherProfile(string subject)
        {
            return UserDL.FetchTeacherProfile(subject);
        }

        public static DataTable FetchStudata(string email)
        {
            return UserDL.FetchStudata(email);
        }
        public static DataSet FetchTeacherFullProfile(int userid)
        {
            return UserDL.FetchTeacherFullProfile(userid);
        }
        public static DataSet FetchDocumentMaterial1()
        {
            return UserDL.FetchDocumentMaterial1();
        }

        public static DataSet FetchVidMaterial()
        {
            return UserDL.FetchVidMaterial();
        }
        public static DataTable FetchArticleID(string title)
        {
            return UserDL.FetchArticleID(title);
        }

        public static void UpdateArticle(int id)
        {
            UserDL.UpdateArticle(id);
        }
        /// <summary>
        /// Author : Mir Bilal

        /// Remark : Call to fetch lesson name.
        /// </summary>
        public static DataTable FetchLesson(int subjectid)
        {
            return UserDL.FetchLesson(subjectid);
        }
        public static DataTable FetchLessonName()
        {
            return UserDL.FetchLessonName();
        }
        public static DataTable FetchTitle(int lessonid)
        {
            return UserDL.FetchTitle(lessonid);
        }
        public static DataTable FetchTitleName()
        {
            return UserDL.FetchTitleName();
        }

        public static DataTable FetchQuestionInformation()
        {
            return UserDL.FetchQuestionInformation();
        }
        public static DataTable FetchExamInformation()
        {
            return UserDL.FetchExamInformation();
        }
        /// <summary>
        /// Author : Mir Bilal
   
        /// Remark : Call to fetch classes for the dropdownlist(class) in teacher's upload material...
        /// <returns></returns>
        public static DataTable FetchClass()
        {
            return UserDL.FetchClass();
        }
        public static DataTable FetchTutorSubject()
        {
            return UserDL.FetchTutorSubject();
        }
        public static DataTable FetchSubject()
        {
            return UserDL.FetchSubject();
        }
        public static bool deleteDetail(string query)
        {
            return UserDL.deleteDetail(query);
        }

        public static bool deleteUser(int userid)
        {
            return UserDL.deleteUser(userid);
        }
        public static bool UpdateDetails(string query)
        {
            return UserDL.UpdateDetails(query);
        }

        public static DataTable fetchVideos(string file)
        {
            return UserDL.fetchVideos(file);
        }

        /// <summary>
        /// Author: Mir Bilal
        
        /// Remark : Call to Fetch subjects for the dropdownlist of subject
        /// </summary>
        public static DataTable FetchSubject(int classid)
        {
            return UserDL.FetchSubject(classid);
        }


        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Call to upload the file which  teacher wants to upload..
        /// </summary>
        public static bool Material(int typeid, int classid,int subjectid,int lessonid, int filesize, string filename)
        {
            return UserDL.Material(typeid,classid, subjectid,lessonid, filesize, filename);
        }

        public static bool UpdateMaterial(string fname,int materialid)
        {
            return UserDL.UpdateMaterial(fname, materialid);
        }
        public static bool VideoMaterial(int typeid, int classid, int subjectid, int lessonid, string filename,string title)
        {
            return UserDL.VideoMaterial(typeid, classid, subjectid, lessonid, filename,title);
        }

        public static bool UpdateVideoMaterial(string videoid,string newTitle,int vid)
        {
            return UserDL.UpdateVideoMaterial(videoid, newTitle, vid);
        }
        public static bool QuestionPaperUpload(int typeid, int classid, int subjectid, int filesize, string filename)
        {
            return UserDL.QuestionPaperUpload(typeid, classid, subjectid, filesize, filename);
        }
        public static bool SyllabusUpload(int typeid, int classid, int subjectid, int filesize, string filename)
        {
            return UserDL.SyllabusUpload(typeid, classid, subjectid, filesize, filename);
        }

        public static bool ArticleUpload(string title,int typeid, int filesize, string filename)
        {
            return UserDL.ArticleUpload(title,typeid, filesize, filename);
        }

        public static bool UpdateArticle(string article,int articleid)
        {
            return UserDL.UpdateArticle(article,articleid);
        }
        //-------Teacher-Welcome(Notifications)----------------------------Teacher-------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
 
        /// Remark : Call to insert notification with their current date and time...
        /// </summary>
        public static bool InsertNotificationSpecific(string name, string filename, string filepath, string date, int duration, string type)
        {
            return UserDL.InsertNotificationSpecific(name, filename, filepath, date, duration, type);
        }

        public static bool InsertNotificationResult(string name, string filename, string date, int duration, string type)
        {

            return UserDL.InsertNotificationResult(name, filename, date, duration, type);
        }


        //------Student-Welcome(Notifications)-----------------------------Student----------------------------------------------------------------------------

        public static DataTable FetchWelcomeName(string email)
        {
            return UserDL.FetchWelcomeName(email);
        }

        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to fetch name of the teacher which uploaded notifications...
        /// </summary>
        public static DataTable FetchNoticeRoleName(string email)
        {
            return UserDL.FetchNoticeRoleName(email);
        }
        public static DataTable FetchNoticeRoleName1()
        {
            return UserDL.FetchNoticeRoleName1();
        }

        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to fetch notifications of the teachers with their current date and time ..
        /// </summary>
        public static DataTable FetchNotificationAndDate()
        {
            return UserDL.FetchNotificationAndDate();
        }

        public static bool AssignAssignment(string TeacherName, string AssignmentName, int classid, int subjectid)
        {
            return UserDL.AssignAssignment(TeacherName, AssignmentName, classid, subjectid);
        }


        public static DataTable FetchAssignAssignment(int classid, int subjectid)
        {
            return UserDL.FetchAssignAssignment(classid, subjectid);
        }


        //-------Evaluate-Assignment----------------------------------------Teacher---------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to Fetch assignments submmited by the students...
        /// </summary>
        public static DataTable Fetchassignment(int classid, int subjectid)
        {
            return UserDL.Fetchassignment(classid, subjectid);
        }

        /// <summary>
        /// Author : Mir Bilal
   
        /// Remark : Call to Update the remark field to indicate accept and reject result of assignments submmited by the students...
        /// </summary>
        public static bool UpdateNotificationRemark(int ide, bool status)
        {
            return UserDL.UpdateNotificationRemark(ide, status);
        }

        //-------Assignment--------------------------------------------------Student---------------------------------------------------------------------------

        public static bool AlreadySubmitAssignment(int userid, int classid, int subjectid, int assignmentid)
        {
            if (UserDL.AlreadySubmitAssignment(userid, classid, subjectid, assignmentid).Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Reamrk : Call to Insert the assignment submitted by particular student ...
        /// </summary>     
        public static bool UploadAssignment(int userid, int classid, int subjectid, string filename, string assignmentname, int assignmentid)
        {
            return UserDL.UploadAssignment(userid, classid, subjectid, filename, assignmentname, assignmentid);
        }


        //---- VIEW MATERIAL -------------------------------------------------STUDENT------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
 
        /// Remark :
        /// </summary>
        public static DataTable FetchQuestionPapers(int classid, int subjectid, int typeid)
        {
            return UserDL.FetchQuestionPapers(classid, subjectid, typeid);
        }
        public static DataTable FetchFetchSyllabus(int classid, int subjectid, int typeid)
        {
            return UserDL.FetchFetchSyllabus(classid, subjectid, typeid);
        }
        public static DataTable Fetchmaterialdetails(int classid, int subjectid,int lessonid, int typeid)
        {
            return UserDL.Fetchmaterialdetails(classid, subjectid,lessonid, typeid);
        }

        public static DataTable FetchVideomaterialdetails(int classid, int subjectid, int lessonid, int typeid)
        {
            return UserDL.FetchVideomaterialdetails(classid, subjectid, lessonid, typeid);
        }
        //------Set Theory Paper------------------------------------------------------Teacher------------------------------------------------------------------------   


        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to set paperinformation for examination
        /// </summary>    
        public static bool InsertPaperInfo(string classname, string subjectname, int papertime, int Papermarks, int passmarks)
        {
            return UserDL.InsertPaperInfo(classname, subjectname, papertime, Papermarks, passmarks);
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to fetch paperid for examination...
        /// </summary>
        public static DataTable FetchPaperId(string classname, string subjectname)
        {
            return UserDL.FetchPaperId(classname, subjectname);
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to fetch ObjectiveQuestionid for examination...
        /// </summary>
        public static DataTable FetchTheoryPaperQuestionId(int paperid)
        {
            return UserDL.FetchTheoryPaperQuestionId(paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
    
        /// Remark : Call to fetch marks-utilized per question for examination...
        /// </summary>
        public static DataTable FetchTheoryMarksUtilized(int questionid)
        {
            return UserDL.FetchTheoryMarksUtilized(questionid);
        }

        /// <summary>
        /// Author : Mir Bilal
  
        /// Remark : Call to insert questions for examination....
        /// </summary>
        public static bool SetQuestion(string quesno, string question, string ans, string marks, int paperid, int marksleft)
        {
            return UserDL.SetQuestion(quesno, question, ans, marks, paperid, marksleft);
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Call to view paper information (View Button Click)
        /// </summary>    
        public static DataTable ViewPaperInfo(int paperid)
        {
            return UserDL.ViewPaperInfo(paperid);

        }

        /// <summary>
        /// Author : Mir Bilal

        /// Remark : Call to view Questions set for the examination (View Button Click)
        /// </summary>
        public static DataTable ViewQuestion(int paperid)
        {
            return UserDL.ViewQuestion(paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
   
        /// Remark : Call to delete paper-information and questions for the examination...
        /// </summary>  
        public static bool DeletePapers(int paperid)
        {
            return UserDL.DeletePapers(paperid);
        }


        //----Examination-Theory-----------------------------------------------------------Student-----------------------------------------------------------------------------------

        /// <summary>
        /// Author : Mir Bilal
 
        /// Remark : Call to check wheather particular student has already submitted their answers for the Questions of particular subject....
        /// </summary>
        public static DataTable FetchTheoryRemark(int userid, int paperid)
        {
            return UserDL.FetchTheoryRemark(userid, paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
  
        /// Remark : Call to fetch Questions of particular subject....
        /// </summary>
        public static DataTable FetchPaperInfo(int paperid)
        {
            return UserDL.FetchPaperInfo(paperid);

        }

        /// <summary>
        /// Author : Mir Bilal
 
        /// Remark : Call to fetch paper-information of particular subject....
        /// </summary>
        public static DataTable FetchQuestion(int paperid)
        {
            return UserDL.FetchQuestion(paperid);
        }

        /// <summary>
        /// Author : Mir Bilal

        /// Remark : Call to fetch user-id of particular student....
        /// </summary>
        public static DataTable UserId(string email)
        {
            return UserDL.UserId(email);
        }

        public static DataTable getAnsInfo(int userid,int paperid)
        {
            return UserDL.getAnsInfo(userid,paperid);
        }

        public static DataTable getAttemptedQuestions(int userid, int paperid)
        {
            return UserDL.getAttemptedQuestions(userid, paperid);
        }
        public static DataTable getWrongAnsweredQuestions(int userid, int paperid)
        {
            return UserDL.getWrongAnsweredQuestions(userid, paperid);
        }

        public static DataTable getCorrectAnsweredQuestions(int userid, int paperid)
        {
            return UserDL.getCorrectAnsweredQuestions(userid, paperid);
        }
        /// <summary>
        /// Author : Mir Bilal
  
        /// Remark : Call to store student's name in attendance table 
        /// </summary>
        public static void InsertAttendance(int paperid, string name, int userid)
        {
            UserDL.InsertAttendance(paperid, name, userid);
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to store answers of particular student's in answer table...
        /// </summary>
        public static void InsertAnswer(string answer, int questionid, int paperid, int userid)
        {
            UserDL.InsertAnswer(answer, questionid, paperid, userid);
        }

        public static DataTable FetchClassname(int classid)
        {
            return UserDL.FetchClassname(classid);
        }

        public static DataTable FetchSubjectname(int subjectid)
        {
            return UserDL.FetchSubjectname(subjectid);
        }

        public static void SubmitPaperRemark(int userid, string classname, string subjectname, int paperid)
        {
            UserDL.SubmitPaperRemark(userid, classname, subjectname, paperid);
        }


        //----Evaluate-Papers ----------------------------------------------------------------Teacher-------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to fetch names of appeared students in the examination in particular subject ...
        /// </summary>
        public static DataTable FetchAppearedStudents(int paperid)
        {
            return UserDL.FetchAppearedStudents(paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
    
        /// Remark : Call to fetch answers of particular student for the questions set in the examination for evaluation(checking).....
        /// </summary>
        public static DataTable FetchAnswers(int userid, int paperid)
        {
            return UserDL.FetchAnswers(userid, paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to check wheather the answer-paper of particular student is already checked....
        /// </summary>
        public static DataTable AlreadyChecked(int userid , int paperid)
        {
            return UserDL.AlreadyChecked(userid ,paperid);

        }

        /// <summary>
        /// Author : Mir Bilal
   
        /// Remark : Call to submit marks for the answers submitted by the student...
        /// </summary>
        public static void InsertMarks(string strValue, int questionid, int paperid, int userid)
        {
            UserDL.InsertMarks(strValue, questionid, paperid, userid);
        }

        /// <summary>
        /// Author : Mir Bilal
  
        /// Remark : Call to fetch all marks of the answers  of the student...
        /// </summary>
        public static DataTable FetchMarks(int paperid, int userid)
        {
            return UserDL.FetchMarks(paperid, userid);
        }

        /// <summary>
        /// Author : Mir Bilal
 
        /// Remark : Call to generate result of particular student...
        /// </summary>
        public static bool GenerateResult(int userid, string classname, string subjectname, int marksobtained, string result, int paperid)
        {
            return UserDL.GenerateResult(userid, classname, subjectname, marksobtained, result, paperid);
        }


        //----Theory-Result-----------------------------------------------------Student-------------------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to view result of student based on name...
        /// </summary>
        public static DataTable ViewResultName(string email, int paperid)
        {
            return UserDL.ViewResultName(email, paperid);
        }
        //public static DataTable ViewResultName(string name, int paperid)
        //{
        //    return UserDL.ViewResultName(name, paperid);
        //}
        /// <summary>
        /// Author : Mir Bilal
   
        /// Remark : Call to view result of student based on user-ID ...
        /// </summary>
        public static DataTable ViewResultID(int userid, int paperid)
        {
            return UserDL.ViewResultID(userid, paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
  
        /// Remark : Call to view full result of students...
        /// </summary>
        public static DataTable ViewFullResult(string classname, string subjectname, int paperid)
        {
            return UserDL.ViewFullResult(classname, subjectname, paperid);
        }


        //------Set Objective Paper-----------------------------------------------Teacher------------------------------------------------------------------------------------------------------------

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to set Objectivepaperinformation for examination
        /// </summary>    
        public static bool InsertObjectivePaperInfo(string classname, string subjectname,string chaptername)
        {
            return UserDL.InsertObjectivePaperInfo(classname, subjectname,chaptername);
        }

        public static bool UpdateObjectivepaper(string papermarks,string passmarks,int pid)
        {
            return UserDL.UpdateObjectivepaper(papermarks, passmarks, pid);
        }

        /// <summary>
        /// Author : Mir Bilal
 
        /// Remark : Call to fetch Objectpaperid for examination...
        /// </summary>
        public static DataTable FetchObjectivePaperId(string classname, string subjectname,string chaptername)
        {
            return UserDL.FetchObjectivePaperId(classname, subjectname,chaptername);
        }

        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to fetch ObjectiveQuestionid for examination...
        /// </summary>
        public static DataTable FetchQuestionId(int paperid)
        {
            return UserDL.FetchQuestionId(paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to fetch marks-utilized per question for examination...
        /// </summary>
        public static DataTable FetchMarksUtilized(int questionid)
        {
            return UserDL.FetchMarksUtilized(questionid);
        }


        /// <summary>
        /// Author : Mir Bilal
 
        /// Remark : Call to insert objective questions for examination....
        /// </summary>
        public static bool SetObjectiveQuestion(string quesno, string question, string ans1, string ans2, string ans3, string ans4, string anskey, int paperid,int marks,string image)
        {
            return UserDL.SetObjectiveQuestion(quesno, question, ans1, ans2, ans3, ans4, anskey, paperid,marks,image);
        }
        public static bool UpdateObjectiveQuestion(string question, string ans1, string ans2, string ans3, string ans4, string anskey,int questionid ,int pid)
        {
            return UserDL.UpdateObjectiveQuestion(question, ans1, ans2, ans3, ans4, anskey, questionid, pid);
        }
        /// <summary>
        /// Author : Mir Bilal

        /// Remark : Call to view Objective-paper-information (View Button Click)
        /// </summary>    
        public static DataTable ViewObjectivePaperInfo(int paperid)
        {
            return UserDL.ViewObjectivePaperInfo(paperid);

        }

        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to view Objective-Questions set for the examination (View Button Click)
        /// </summary>
        public static DataTable ViewObjectiveQuestion(int paperid)
        {
            return UserDL.ViewObjectiveQuestion(paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
       
        /// Remark : Call to delete Objective-paper-information and questions for the examination...
        /// </summary>  
        public static bool DeleteObjectivePapers(int paperid)
        {
            return UserDL.DeleteObjectivePapers(paperid);
        }


        //--------Examination Objective------------------------------------------Student----------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to check wheather particular student has already submitted their answers for the Questions of particular subject....
        /// </summary>
        public static bool FetchRemark(int userid, int paperid)
        {
            if (UserDL.FetchRemark(userid, paperid).Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        /// <summary>
        /// Author : Mir Bilal
     
        /// Remark : Call to fetch paper-information of particular subject....
        /// </summary>
        public static DataTable FetchObjectivePaperInfo(int paperid)
        {
            return UserDL.FetchObjectivePaperInfo(paperid);
        }

        public static DataTable getCount(int paperid,int userid)
        {
            return UserDL.getCount(paperid,userid);
        }
        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to fetch objective-Questions of particular subject....
        /// </summary>
        public static DataTable FetchObjectiveQuestion(int paperid)
        {
            return UserDL.FetchObjectiveQuestion(paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
  
        /// Remark : Call to fetch user-id of particular student....
        /// </summary>
        public static DataTable UsrId(string email)
        {
            return UserDL.UsrId(email);
        }

        /// <summary>
        /// Author : Mir Bilal
  
        /// Remark : Call to store student's name in objective-attendance table 
        /// </summary>
        public static void InsertObjectivePaperAttendance(int paperid, string name, int userid)
        {
            UserDL.InsertObjectivePaperAttendance(paperid, name, userid);
        }

        /// <summary>
        /// Author : Mir Bilal
    
        /// Remark : Call to store objective answers  of particular student's in objective-answer table...
        /// </summary>
        public static void InsertObjectiveAnswer(string answer, int questionid, int paperid, int userid, int marks, string anskey)
        {
            UserDL.InsertObjectiveAnswer(answer, questionid, paperid, userid, marks, anskey);
        }
       
        public static void UpdateObjectiveAnswer(string answer, int questionid, int paperid, int userid, int marks, string anskey)
        {
            UserDL.UpdateObjectiveAnswer(answer, questionid, paperid, userid, marks, anskey);
        }

        //-------Objective Result (Objective-examination)--------------------Student---------------------------------------------------------------------------------------------------------------------------------


        /// <summary>
        /// Author : Mir Bilal
      
        /// Remark : Call to Fetch Marks-secured for each objective question by particular student in corresponding subject...
        /// </summary>
        public static DataTable FetchObjectiveMarks(int userid, int paperid)
        {
            return UserDL.FetchObjectiveMarks(userid, paperid);
        }

        /// <summary>
        /// Author : Mir Bilal
   
        /// Remark : Call to Insert total marks and percentage and generates result by summing up all secured-marks of particular student in corresponding subject...
        /// </summary>
        public static void GenerateObjectiveResult(int userid, string classname, string subjectname,string chaptername, int total, decimal percent, int paperid)
        {
            UserDL.GenerateObjectiveResult(userid, classname, subjectname,chaptername, total, percent, paperid);
        }
        public static void DeletePreviousObjectiveResult(int userid, int paperid)
        {
            UserDL.DeletePreviousObjectiveResult(userid,paperid);
        }
        /// <summary>
        /// Author : Mir Bilal
  
        /// Remark : Call to view Objective-result of student based on name...
        /// </summary>
        public static DataTable ObjectiveViewResultName(string name, int paperid)
        {
            return UserDL.ObjectiveViewResultName(name, paperid);
        }

        /// <summary>
        /// Author : Mir Bilal

        /// Remark : Call to view Objective-result of student based on user-ID ...
        /// </summary>
        public static DataTable ObjectiveViewResultID(int userid, int paperid)
        {
            return UserDL.ObjectiveViewResultID(userid, paperid);
        }

        /// <summary>
        /// Author : Mir Bilal

        /// Remark : Call to view Particular Objective Papers full result of students...
        /// </summary>
        public static DataTable ObjectiveViewFullResult(string classname, string subjectname, int paperid)
        {
            return UserDL.ObjectiveViewFullResult(classname, subjectname, paperid);
        }


        //-----Skype----------------------------------------------------------------------------------------------------------------------------------------------------------------------

        public static DataTable OnlineClass(int classid, int subjectid)
        {
            return UserDL.OnlineClass(classid, subjectid);

        }
        public static DataTable FetchStudent(int classid, int subjectid)
        {
            return UserDL.FetchStudent(classid, subjectid);
        }

        public static DataTable FetchStudentSkypeId(int id)
        {
            return UserDL.FetchStudentSkypeId(id);
        }

        public static DataTable FetchTeacher(int classid)
        {
            return UserDL.FetchTeacher(classid);
        }

        public static DataTable FetchUser(int classid)
        {
            return UserDL.FetchUser(classid);
        }

        //------------------------------------------------------------------------------------------------------------------------------------------

        public static bool CheckValidUser(int classid, string email, int subjectid)
        {
            return UserDL.CheckValidUser(classid, email, subjectid);
        }

        public static bool CheckUser(string email)
        {
            return UserDL.CheckUser(email);
        }
        public static bool CheckStudent(string email)
        {
            return UserDL.CheckStudent(email);
        }

        public static bool CheckAdmin(string email)
        {
            return UserDL.CheckAdmin(email);
        }

        public static bool CheckQuestionInfoEntry(string classname,string subjectname,string chaptername)
        {
            return UserDL.CheckQuestionInfoEntry(classname, subjectname, chaptername);
        }
        public static int getpagecount()
        {
            return UserDL.getpagecount();
        }

        public static void InsertFiles(List<string> fileList)
        {
            UserDL.InsertFiles(fileList);

        }

        public static DataTable FetchUserPrivileges(int roleid)
        {
            DataTable userPrivileges = UserDL.FetchUserPrivileges(roleid);
            return userPrivileges;
        }

        public static DataTable getpages()
        {
            return UserDL.getpages();
        }

        public static bool addprivileges(string pagename, int roleid)
        {
            return UserDL.addprivileges(pagename, roleid);
        }
    }
}
