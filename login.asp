<%
Dim conn, connString, rs, username, password

' Retrieve username and password from query string
username = Request.QueryString("username")
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

' Prepare SQL statement to validate user
Dim sql
sql = "SELECT * FROM users WHERE username = '" & Replace(username, "'", "''") & "' AND password = '" & Replace(password, "'", "''") & "'"

' Execute the query
Set rs = conn.Execute(sql)
If Err.Number <> 0 Then
    Response.Write("Error executing query: " & Err.Description)
    Response.End
End If

' Check if user exists
If Not rs.EOF Then
    Response.Write("Login successful! Welcome " & rs("username"))
    ' Redirect to quiz or main page
    Response.Redirect("quiz.html")
Else
    Response.Write("Invalid username or password.")
End If

' Clean up
If Not rs Is Nothing Then
    rs.Close
    Set rs = Nothing
End If
If Not conn Is Nothing Then
    conn.Close
    Set conn = Nothing
End If
%>

