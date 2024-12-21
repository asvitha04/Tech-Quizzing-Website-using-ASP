<%
Dim conn, connString

' Create connection object
Set conn = Server.CreateObject("ADODB.Connection")

' Define connection string using the DSN
connString = "DRIVER={MySQL ODBC 9.0 ANSI Driver};SERVER=localhost;DATABASE=quiz_db;USER=root;PASSWORD=asvirajesh;OPTION=3;"

On Error Resume Next ' Enable error handling

' Open connection
conn.Open connString

If Err.Number <> 0 Then
    Response.Write("Error opening connection: " & Err.Description)
    Response.End
End If

Response.Write("Connection successful!")
%>
