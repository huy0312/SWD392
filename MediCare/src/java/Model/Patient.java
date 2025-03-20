/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class Patient {
    private int id;
    private User user;  // Thay vì userId, ta lưu cả User
    private String dateOfBirth;
    private String phone;
    private String address;

    public Patient(int id, User user, String dateOfBirth, String phone, String address) {
        this.id = id;
        this.user = user;
        this.dateOfBirth = dateOfBirth;
        this.phone = phone;
        this.address = address;
    }

    public int getId() { return id; }
    public User getUser() { return user; }  // Trả về User thay vì userId
    public String getDateOfBirth() { return dateOfBirth; }
    public String getPhone() { return phone; }
    public String getAddress() { return address; }
}

