package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.Register;
import utility.DBConnection;

public class RegisterDAO {

    public boolean registerStudent(Register register) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO registrations "
                    + "(name, email, phone, gender, course, skills) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, register.getName());
            ps.setString(2, register.getEmail());
            ps.setString(3, register.getPhone());
            ps.setString(4, register.getGender());
            ps.setString(5, register.getCourse());
            ps.setString(6, register.getSkills());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}