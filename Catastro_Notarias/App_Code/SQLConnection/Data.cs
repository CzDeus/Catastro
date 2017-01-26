using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

public class Data
{
    /// <summary>
    /// Class to handle the connection string, the openning and closing of SQL connection 
    /// </summary>
    #region Private Properties
    private ConnectionStrings _ConnectionString;
    private bool _UseTransaction = false;
    private SqlTransaction Transaction;
    private SqlConnection Connection;
    #endregion

    #region Public properties
    public string ConnectionString
    {
        get { return this._ConnectionString.ConnectionString; }
        set { this._ConnectionString.ConnectionString = value; }
    }
    public bool UseTransaction
    {
        get { return this._UseTransaction; }
        set
        {
            if (Connection.State == ConnectionState.Closed)
                this._UseTransaction = value;
            else
                throw new Exception("Can't change the UseTransaction value while a connection is open.");
        }
    }
    #endregion

    #region Public methods
    public Data()
    {
        this._ConnectionString = new ConnectionStrings();
        this.Connection = new SqlConnection(this.ConnectionString);
    }

    public Data(bool WithTransaction)
    {
        this._ConnectionString = new ConnectionStrings();
        this._UseTransaction = WithTransaction;
        this.Connection = new SqlConnection(this.ConnectionString);
    }

    //Method to prepare the connection
    public Data(string ConnectionString)
    {
        try
        {
            this._ConnectionString = new ConnectionStrings(ConnectionString);
            Connection = new SqlConnection(this.ConnectionString);
            this.OpenConnection();
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to prepare the connection using transactions
    public Data(string ConnectionString, bool WithTransaction)
    {
        try
        {
            this._ConnectionString = new ConnectionStrings(ConnectionString);
            this._UseTransaction = WithTransaction;
            Connection = new SqlConnection(this.ConnectionString);
            this.OpenConnection();
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to open the connection
    public void OpenConnection()
    {
        try
        {
            if (this.ConnectionString.Length > 0)
            {
                if (this.Connection.State == ConnectionState.Closed)
                    Connection.Open();
                if (_UseTransaction)
                    Transaction = Connection.BeginTransaction();
            }
            else throw new Exception("A connection string have not been stablished.");
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to close the connection
    public void CloseConnection()
    {
        if (this.Connection.State != ConnectionState.Closed)
            Connection.Close();
    }

    //Method to Execute a Query returning a table
    public DataTable ExecuteQuery(string Query)
    {
        DataTable Table = new DataTable();
        try
        {
            SqlCommand Command = new SqlCommand(Query, Connection);
            if (_UseTransaction) Command.Transaction = Transaction;
            SqlDataAdapter da = new SqlDataAdapter(Command);
            da.Fill(Table);
            return Table;
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a Query with returning nothing
    public void ExecuteNonQuery(string NonQuery)
    {
        try
        {
            SqlCommand Command = new SqlCommand(NonQuery, Connection);
            if (_UseTransaction) Command.Transaction = Transaction;
            Command.ExecuteNonQuery();
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, receiving parameters and returning one DataTable
    public DataTable ExecuteSPQuery(SqlParameter[] Parameters, string SPName)
    {
        DataTable Table = new DataTable();
        SqlDataAdapter Adapter = new SqlDataAdapter();

        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            Command.CommandType = CommandType.StoredProcedure; // ¿CommandType.StoredProcedure?
            if (Parameters != null) Command.Parameters.AddRange(Parameters);
            if (_UseTransaction) Command.Transaction = Transaction;
            Adapter.SelectCommand = Command;
            Adapter.Fill(Table);
            return Table;
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, receiving one parameter and returning one DataTable
    public DataTable ExecuteSPQuery(SqlParameter Parameter, string SPName)
    {
        DataTable Table = new DataTable();
        SqlDataAdapter Adapter = new SqlDataAdapter();

        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            if (Parameter != null) Command.Parameters.Add(Parameter);
            if (_UseTransaction) Command.Transaction = Transaction;
            Adapter.SelectCommand = Command;
            Adapter.Fill(Table);
            return Table;
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, returning one DataTable
    public DataTable ExecuteSPQuery(string SPName)
    {
        DataTable Table = new DataTable();
        SqlDataAdapter Adapter = new SqlDataAdapter();

        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            Command.CommandType = CommandType.StoredProcedure; // ¿CommandType.StoredProcedure?
            if (_UseTransaction) Command.Transaction = Transaction;
            Adapter.SelectCommand = Command;
            Adapter.Fill(Table);
            return Table;
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, receiving parameters and returning one integer
    public int ExecuteSPNonQuery(SqlParameter[] Parameters, string SPName)
    {
        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            if (Parameters != null) Command.Parameters.AddRange(Parameters);
            Command.CommandType = CommandType.StoredProcedure; // ¿CommandType.StoredProcedure?
            if (_UseTransaction) Command.Transaction = Transaction;
            return Command.ExecuteNonQuery();
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, receiving one parameter and returning one integer
    public int ExecuteSPNonQuery(SqlParameter Parameter, string SPName)
    {
        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            if (Parameter != null) Command.Parameters.Add(Parameter);
            Command.CommandType = CommandType.StoredProcedure;
            if (_UseTransaction) Command.Transaction = Transaction;
            return Command.ExecuteNonQuery();
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, receiving parameters and returning one DataSet
    public DataSet ExecuteSPQueryDataSet(SqlParameter[] Parameters, string SPName)
    {
        DataSet dataSet = new DataSet();
        SqlDataAdapter Adapter = new SqlDataAdapter();

        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            if (Parameters != null) Command.Parameters.AddRange(Parameters);
            if (_UseTransaction) Command.Transaction = Transaction;
            Adapter.SelectCommand = Command;
            Adapter.Fill(dataSet);
            return dataSet;
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, receiving one parameter and returning one DataSet
    public DataSet ExecuteSPQueryDataSet(SqlParameter Parameter, string SPName)
    {
        DataSet dataSet = new DataSet();
        SqlDataAdapter Adapter = new SqlDataAdapter();

        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            if (Parameter != null) Command.Parameters.Add(Parameter);
            if (_UseTransaction) Command.Transaction = Transaction;
            Adapter.SelectCommand = Command;
            Adapter.Fill(dataSet);
            return dataSet;
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, returning one DataSet
    public DataSet ExecuteSPQueryDataSet(string SPName)
    {
        DataSet dataSet = new DataSet();
        SqlDataAdapter Adapter = new SqlDataAdapter();

        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            if (_UseTransaction) Command.Transaction = Transaction;
            Adapter.SelectCommand = Command;
            Adapter.Fill(dataSet);
            return dataSet;
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, receiving parameters and returning one scalar
    public object ExecuteSPQueryScalar(SqlParameter[] Parameters, string SPName)
    {
        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            if (Parameters != null) Command.Parameters.AddRange(Parameters);
            if (_UseTransaction) Command.Transaction = Transaction;
            return Command.ExecuteScalar();
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure, receiving one parameter and returning one scalar
    public object ExecuteSPQueryScalar(SqlParameter Parameter, string SPName)
    {
        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            if (Parameter != null) Command.Parameters.Add(Parameter);
            if (_UseTransaction) Command.Transaction = Transaction;
            return Command.ExecuteScalar();
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to Execute a store procedure and returning one scalar
    public object ExecuteSPQueryScalar(string SPName)
    {
        try
        {
            SqlCommand Command = new SqlCommand(SPName, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            if (_UseTransaction) Command.Transaction = Transaction;
            return Command.ExecuteScalar();
        }
        catch (Exception Ex) { throw new Exception(Ex.Message, Ex.InnerException); }
    }

    //Method to hadle the commit transaction
    public void CommitTransaction()
    {
        if (Transaction != null)
            if (Connection.State == ConnectionState.Open)
            {
                Transaction.Commit();
                CloseConnection();
            }
            else
                throw new Exception("Can not commit transaction that have no connection open.");
        else
            throw new Exception("Can not commit a transaction that's not open.");
    }

    //Method to hadle the rollback transaction 
    public void RollBackTransaction()
    {
        if (Transaction != null)
            if (Connection.State == ConnectionState.Open)
            {
                Transaction.Rollback();
                CloseConnection();
            }
            else
                throw new Exception("Can not rollback transaction that have no connection open.");
        else
            throw new Exception("Can not rollback a transaction that's not open.");
    }

    #endregion
}