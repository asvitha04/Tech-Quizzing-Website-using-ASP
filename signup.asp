<%
Dim conn, connString, sql, username, email, password

' Retrieve username, email, and password from query string
username = Request.QueryString("username")
email = Request.QueryString("email")
password = Request.QueryString("password")

' Create connection object
Set conn = Server.CreateObject("ADODB.Connection")
connString = "DSN=Quiz_DB;UID=root;PWD=asvirajesh;" 

On Error Resume Next

' Open connection
conn.Open connString
If Err.Number <> 0 Then
    Response.Write("Error opening connection: " & Err.Description)
    Response.End
End If

' Prepare SQL statement to insert new user
sql = "INSERT INTO users (username, email, password) VALUES ('" & Replace(username, "'", "''") & "', '" & Replace(email, "'", "''") & "', '" & Replace(password, "'", "''") & "')"

' Execute the query
conn.Execute(sql)
If Err.Number <> 0 Then
    Response.Write("Error executing query: " & Err.Description)
    Response.End
Else
    Response.Write("Signup successful! Welcome " & username)
    ' Redirect to login page or any other page
    Response.Redirect("index1.html")
End If

' Clean up
conn.Close
Set conn = Nothing
%>
