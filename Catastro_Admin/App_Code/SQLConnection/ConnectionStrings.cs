using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;

public class ConnectionStrings : Object
    {
        /// <summary>
        /// Class that contains properties and methods to manage the Connections string
        /// </summary>
        #region Properties
        private string _Server;
        public string Server
        {
            get { return _Server; }
            set { _Server = value; }
        }

        private string _User;
        public string User
        {
            get { return _User; }
            set
            {
                if (_User != null) _ConnectionString.Replace(_User, value);
                _User = value;
            }
        }

        private string _Password;
        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }

        private string _DataBase;
        public string DataBase
        {
            get { return _DataBase; }
            set { _DataBase = value; }
        }

        //private bool _IntegratedSecurity = false;
        //public bool IntegratedSecurity
        //{
        //    get { return _IntegratedSecurity; }
        //    set { _IntegratedSecurity = value; }
        //}

        private string _ConnectionString;
        public string ConnectionString
        {
            get { return _ConnectionString; }
            set
            {
                _ConnectionString = value;
                this.SplitConnectionString();
            }
        }

        private string _ConnectionID;
        public string ConnectionID
        {
            get { return _ConnectionID; }
            set { _ConnectionID = value; }
        }
        #endregion

        #region Public methods

        //Method to create the connection strings
        public ConnectionStrings() 
        {
            this.ConnectionString = ConfigurationManager.ConnectionStrings["db_Catastros_ConnectionString"].ToString();
        }

        //Method to create the connection string, with the connection string parameter
        public ConnectionStrings(string ConnectionString)
        {
            this.ConnectionString = ConnectionString;
        }

        //Method to create the connection string, with the connection string parameter and Connection ID
        public ConnectionStrings(string ConnectionString, string ConnectionID)
        {
            this.ConnectionString = ConnectionString;
            this.ConnectionID = ConnectionID;
        }

        //Method to create the connection string, with the all the connection sections
        //public ConnectionStrings(string Server, string DataBase, string UserId, string Password, bool IntegratedSecurity)
        //{
        //    this.ConnectionString = CreateMySqlConnectionString(Server, DataBase, UserId, Password, IntegratedSecurity);
        //}
        public ConnectionStrings(string Server, string DataBase, string UserId, string Password)
        {
            this.ConnectionString = CreateMySqlConnectionString(Server, DataBase, UserId, Password);
        }

        //Method to rebuild the Connection string
        public void ReMakeMsSqlConnectionString()
        {
            //if (!this.IntegratedSecurity)
                this._ConnectionString = "Server=" + _Server + ";Database=" + _DataBase + ";Uid=" +
                    _User + ";Pwd=" + _Password + ";";
            //else
            //    this._ConnectionString = "Server=" + _Server + ";Database=" + _DataBase +
            //        ";Integrated Security=True;";
        }

        public override bool Equals(object obj)
        {
            if (obj == null || GetType() != obj.GetType()) return false;

            ConnectionStrings ConnectionString = (ConnectionStrings)obj;
            //return this.ConnectionID == ConnectionString.ConnectionID && this.DataBase == ConnectionString.DataBase
            //    && this.IntegratedSecurity == ConnectionString.IntegratedSecurity && this.Password ==
            //    ConnectionString.Password && this.Server == ConnectionString.Server && this.User ==
            //    ConnectionString.User && this.ConnectionString == ConnectionString.ConnectionString;
            return this.ConnectionID == ConnectionString.ConnectionID && this.DataBase == ConnectionString.DataBase
                && this.Password == ConnectionString.Password && this.Server == ConnectionString.Server
                && this.User == ConnectionString.User && this.ConnectionString == ConnectionString.ConnectionString;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
        #endregion

        #region Private methods
        //Method to set the values for each section of the connection
        private void SplitConnectionString()
        {
            String[] ConnectionStringSplitted;
            try
            {
                ConnectionStringSplitted = this._ConnectionString.Split(new char[] { ';' },
                    StringSplitOptions.RemoveEmptyEntries);

                for (int x = 0; x < ConnectionStringSplitted.Length; x++)
                {
                    switch (ConnectionStringSplitted[x].Substring(0, ConnectionStringSplitted[x].IndexOf("=")).ToLower())
                    {
                        case "server":
                            this.Server = ConnectionStringSplitted[x].Substring(
                                ConnectionStringSplitted[x].IndexOf('=') + 1);
                            break;
                        case "database":
                            this.DataBase = ConnectionStringSplitted[x].Substring(
                                ConnectionStringSplitted[x].IndexOf('=') + 1);
                            break;
                        case "uid":
                            this.User = ConnectionStringSplitted[x].Substring(
                                ConnectionStringSplitted[x].IndexOf('=') + 1);
                            break;
                        case "pwd":
                            this.Password = ConnectionStringSplitted[x].Substring(
                                ConnectionStringSplitted[x].IndexOf('=') + 1);
                            break;
                        //case "integrated security":
                        //    try
                        //    {
                        //        this.IntegratedSecurity = Convert.ToBoolean(ConnectionStringSplitted[x].Substring(
                        //            ConnectionStringSplitted[x].IndexOf('=') + 1));
                        //    }
                        //    catch (Exception) { IntegratedSecurity = false; }
                        //    break;
                    }
                }
            }
            catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }

        }
        #endregion

        #region Public Static Methods
        //Method to create the connection string for MS SQL 
        //public static string CreateMsSqlConnectionString(string Server, string DataBase, string User, string Password,
        //    bool IntegratedSecurity)
        //{
        //    string ConnectionString = "";
        //    if (!IntegratedSecurity)
        //        ConnectionString = "Data Source=" + Server + ";Initial Catalog=" + DataBase + ";User ID=" +
        //            User + ";Password=" + Password + ";";
        //    else
        //        ConnectionString = "Data Source=" + Server + ";Initial Catalog=" + DataBase + 
        //            ";Integrated Security=True;";
        //    return ConnectionString;
        //}

        public static string CreateMySqlConnectionString(string Server, string DataBase, string User, string Password)
        {
            string ConnectionString = "";
            ConnectionString = "Server=" + Server + ";Database=" + DataBase + ";Uid=" +
                User + ";Pwd=" + Password + ";";
            return ConnectionString;
        }

        #endregion
    }