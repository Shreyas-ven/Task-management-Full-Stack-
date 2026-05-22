package model;

public class Task {
    private int id;
    private int user_id;
    private String taskName;

    public Task() {

    }

    public Task(int id, int user_id, String taskName) {
        this.id = id;
        this.user_id = user_id;
        this.taskName = taskName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return user_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }
}