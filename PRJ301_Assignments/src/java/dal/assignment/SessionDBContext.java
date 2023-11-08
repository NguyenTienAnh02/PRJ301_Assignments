/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.assignment;

import dal.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.assingment.Attendance;
import model.assingment.Group;
import model.assingment.Room;
import model.assingment.Session;
import model.assingment.Student;
import model.assingment.StudentStatus;
import model.assingment.Subject;
import model.assingment.TimeSlot;

/**
 *
 * @author sonnt
 */
public class SessionDBContext extends DBContext<Session> {

    public ArrayList<Session> getSessions(int iid, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT  \n"
                    + "	ses.sesid,ses.[date],ses.[index],ses.isAtt,r.roomid,sub.subid,sub.subname,g.gid,g.gname,t.tid,t.[description]\n"
                    + "FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n"
                    + "			INNER JOIN [Subject] sub ON g.subid = sub.subid\n"
                    + "			INNER JOIN Room r ON r.roomid = ses.rid\n"
                    + "			INNER JOIN TimeSlot t ON ses.tid = t.tid\n"
                    + "WHERE ses.iid = ? AND ses.[date] >= ? AND ses.[date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, iid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Room r = new Room();
                r.setId(rs.getString("roomid"));
                session.setRoom(r);

                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                session.setGroup(g);

                Subject sub = new Subject();
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                g.setSubject(sub);

                TimeSlot time = new TimeSlot();
                time.setId(rs.getInt("tid"));
                time.setDescription(rs.getString("description"));
                session.setSlot(time);

                sessions.add(session);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public Session getSessionsAtt(int sesid) {
        try {
            String sql = "SELECT  \n"
                    + "	ses.sesid,ses.[date],ses.[index],ses.isAtt,r.roomid,sub.subid,sub.subname,g.gid,g.gname,t.tid,t.[description]\n"
                    + "FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n"
                    + "				INNER JOIN [Subject] sub ON g.subid = sub.subid\n"
                    + "				INNER JOIN Room r ON r.roomid = ses.rid\n"
                    + "				INNER JOIN TimeSlot t ON ses.tid = t.tid\n"
                    + "WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Room r = new Room();
                r.setId(rs.getString("roomid"));
                session.setRoom(r);

                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                session.setGroup(g);

                Subject sub = new Subject();
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                g.setSubject(sub);

                TimeSlot time = new TimeSlot();
                time.setId(rs.getInt("tid"));
                time.setDescription(rs.getString("description"));
                session.setSlot(time);
                return session;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addAttendences(Session ses) {
        try {
            connection.setAutoCommit(false);
            //Update isAtt
            String sql_update_isAtt = "UPDATE Session SET isAtt = 1 WHERE sesid = ?";
            PreparedStatement stm_update_isAtt = connection.prepareStatement(sql_update_isAtt);
            stm_update_isAtt.setInt(1, ses.getId());
            stm_update_isAtt.executeUpdate();

            //Remove existing attendences
            String sql_remove_atts = "DELETE Attendance WHERE sesid = ?";
            PreparedStatement stm_remove_atts = connection.prepareStatement(sql_remove_atts);
            stm_remove_atts.setInt(1, ses.getId());
            stm_remove_atts.executeUpdate();

            //Insert attendences 
            for (Attendance att : ses.getAtts()) {
                String sql_insert_att = "INSERT INTO [Attendance]\n"
                        + "           ([sesid]\n"
                        + "           ,[stuid]\n"
                        + "           ,[status]\n"
                        + "           ,[description]\n"
                        + "           ,[att_datetime])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,GETDATE())";
                PreparedStatement stm_insert_att = connection.prepareStatement(sql_insert_att);
                stm_insert_att.setInt(1, ses.getId());
                stm_insert_att.setInt(2, att.getStudent().getId());
                stm_insert_att.setBoolean(3, att.isStatus());
                stm_insert_att.setString(4, att.getDescription());
                stm_insert_att.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void insert(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Session get(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Session> getSessionsByGroupID(int id) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT  \n"
                    + "	ses.sesid,ses.[date],ses.[index],ses.isAtt,r.roomid,sub.subid,sub.subname,g.gid,g.gname,t.tid,t.[description]\n"
                    + "FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n"
                    + "			INNER JOIN [Subject] sub ON g.subid = sub.subid\n"
                    + "			INNER JOIN Room r ON r.roomid = ses.rid\n"
                    + "			INNER JOIN TimeSlot t ON ses.tid = t.tid\n"
                    + "WHERE ses.gid = ? order by ses.[date]";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Room r = new Room();
                r.setId(rs.getString("roomid"));
                session.setRoom(r);

                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                session.setGroup(g);

                Subject sub = new Subject();
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                g.setSubject(sub);

                TimeSlot time = new TimeSlot();
                time.setId(rs.getInt("tid"));
                time.setDescription(rs.getString("description"));
                session.setSlot(time);

                sessions.add(session);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public HashMap<Student,List<StudentStatus>> getStudentStatusByGroupID(int id) {
        HashMap<Student,List<StudentStatus>> hashmap = new HashMap<>();
        try {
            String sql = "Select * from Student stu left join Group_Student gru on stu.stuid = gru.stuid left join Attendance [at] on [at].stuid = stu.stuid where gru.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt(1));
                student.setName(rs.getString(2));
                student.setMssv(rs.getString(3));
                StudentStatus studentStatus = new StudentStatus();
                studentStatus.setSesid(rs.getInt(6));
                studentStatus.setStatus(rs.getBoolean("status"));
                if(hashmap.containsKey(student)){
                    List<StudentStatus> studentStatuss = hashmap.get(student);
                    studentStatuss.add(studentStatus);
                    hashmap.put(student, studentStatuss);
                }
                else {
                    List<StudentStatus> studentStatuss = new ArrayList<>();
                    hashmap.put(student, studentStatuss);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hashmap;
    }

}
