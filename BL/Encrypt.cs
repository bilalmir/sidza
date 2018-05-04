using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logic.BL
{
    public class Encrypt
    {
        /// <summary>
        /// This method shall encrypt the passed string
        /// </summary>
        /// <param name="password"></param>
        /// <returns></returns>
        public static string EncryptPassword(string password)
        {
            byte[] asciiBytes = Encoding.ASCII.GetBytes(password);
            byte[] new_arr = new byte[asciiBytes.Length];


            for (int i = 0; i < asciiBytes.Length; i++)
            {

                new_arr[i] = ++asciiBytes[i];
            }

            string encryptpass = Encoding.ASCII.GetString(new_arr);
            return encryptpass;
        }

        public static string DecryptPassword(string password)
        {
            byte[] asciiBytes = Encoding.ASCII.GetBytes(password);
            byte[] new_arr = new byte[asciiBytes.Length];


            for (int i = 0; i < asciiBytes.Length; i++)
            {

                new_arr[i] = --asciiBytes[i];
            }

            string encryptpass = Encoding.ASCII.GetString(new_arr);
            return encryptpass;
        }
    }
}