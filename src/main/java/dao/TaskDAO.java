package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.Task;
import utility.DBConnection;

public class TaskDAO {
	public boolean addTask(Task task) {
		boolean status = false;
		try {
			Connection con = DBConnection.getConnection();
			String query ="INSERT INTO tasks (user_id,task_name) VALUES (?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, task.getUserId());
			ps.setString(2, task.getTaskName());
			
			int rows= ps.executeUpdate();
			if(rows>0) {
				status = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
}
