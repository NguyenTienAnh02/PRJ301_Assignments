/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.assingment;

/**
 *
 * @author anh40
 */
public class StudentStatus {
    private int sesid;
    private boolean status;

    public StudentStatus() {
    }

    public StudentStatus(int sesid, boolean status) {
        this.sesid = sesid;
        this.status = status;
    }
    
    public int getSesid() {
        return sesid;
    }

    public void setSesid(int sesid) {
        this.sesid = sesid;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}

