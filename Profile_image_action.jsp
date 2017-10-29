<%@ page import="java.io.*,java.sql.*" %>
<%
    String saveFile = "";
    String contentType = request.getContentType();
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        DataInputStream in = new DataInputStream(request.getInputStream());
        int formDataLength = request.getContentLength();
        byte dataBytes[] = new byte[formDataLength];
        int byteRead = 0;
        int totalBytesRead = 0;
        while (totalBytesRead < formDataLength) {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
            totalBytesRead += byteRead;
        }
        String file = new String(dataBytes);
        saveFile = file.substring(file.indexOf("filename=\"") + 10);
        saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
        saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
        int lastIndex = contentType.lastIndexOf("=");
        String boundary = contentType.substring(lastIndex + 1, contentType.length());
        int pos;
        pos = file.indexOf("filename=\"");
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
        int startPos = ((file.substring(0, pos)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
        File ff = new File("C:/Users/14cseshadath/Documents/NetBeansProjects/Blood 4 Life/web/profile_images/" + saveFile);
        FileOutputStream fileOut = new FileOutputStream(ff);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
        fileOut.close();
        
        PreparedStatement psmnt = null;
        String user_name = (String) session.getAttribute("memberusername");
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT id FROM registrationtable");
            int id = 0;
            if (rs.last()) {
                id = rs.getInt("id") + 1;

                String s = rs.getString("id");
                session.setAttribute("s", s);
            }
            //psmnt = connection.prepareStatement("insert into admin(images,path,username,id_no) values(?,?,?," + id + ")");
            psmnt = connection.prepareStatement("UPDATE registrationtable SET images = ?,path = ?,username = ?,id_no = '" + id + "' WHERE memberusername = '" + user_name + "' ");
            psmnt.setString(1, ff.getName());
            psmnt.setString(2, ff.getPath());
            psmnt.setString(3, user_name);

            int s = psmnt.executeUpdate();
            if (s > 0) {
                out.println("Uploaded successfully !");
            } else {
                out.println("Error!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
%>