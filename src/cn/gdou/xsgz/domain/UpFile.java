package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 文件上传
 */
@SuppressWarnings("serial")
public class UpFile implements Serializable{
	// 文件Id
	private String fileId;
	// 文件名
	private String fileName;
	// 上传时间
	private String upTime;
	// 文件路径
	private String fileUrl;
	// 上传人员
	private String uploadStaff;
	// 申请类型
	private int applyType;

	/**
	 * 文件Id
	 */
	public String getFileId() {
		return fileId;
	}
	/**
	 * 文件Id
	 */
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	/**
	 * 文件名
	 */
	public String getFileName() {
		return fileName;
	}
	/**
	 * 文件名
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * 上传时间
	 */
	public String getUpTime() {
		return upTime;
	}
	/**
	 * 上传时间
	 */
	public void setUpTime(String upTime) {
		this.upTime = upTime;
	}

	/**
	 * 文件路径
	 */
	public String getFileUrl() {
		return fileUrl;
	}
	/**
	 * 文件路径
	 */
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	/**
	 * 上传人员
	 */
	public String getUploadStaff() {
		return uploadStaff;
	}
	/**
	 * 上传人员
	 */
	public void setUploadStaff(String uploadStaff) {
		this.uploadStaff = uploadStaff;
	}

	/**
	 * 申请类型
	 */
	public int getApplyType() {
		return applyType;
	}
	/**
	 * 申请类型
	 */
	public void setApplyType(int applyType) {
		this.applyType = applyType;
	}

}