package com.ssm.pojo;

public class Library {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column library.uid
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    private Integer uid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column library.alid
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    private String alid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column library.uid
     *
     * @return the value of library.uid
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column library.uid
     *
     * @param uid the value for library.uid
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column library.alid
     *
     * @return the value of library.alid
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    public String getAlid() {
        return alid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column library.alid
     *
     * @param alid the value for library.alid
     *
     * @mbggenerated Thu Mar 23 17:43:20 CST 2023
     */
    public void setAlid(String alid) {
        this.alid = alid == null ? null : alid.trim();
    }
}