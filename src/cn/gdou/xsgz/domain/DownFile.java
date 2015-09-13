package cn.gdou.xsgz.domain;

import java.io.Serializable;

/**
 * 文件下载
 */
@SuppressWarnings("serial")
public class DownFile implements Serializable{
	// 文件Id
	private String fileId;
	// 文件名
	private String fileName;
	// 文件路径
	private String fileUrl;
	// 发布时间
	private String releaseTime;
	// 上传者
	private int adminId;
	// 文件描述
	private String description;

	// 管理员实体
	private Admin admin;
	
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
	 * 发布时间
	 */
	public String getReleaseTime() {
		return releaseTime;
	}
	/**
	 * 发布时间
	 */
	public void setReleaseTime(String releaseTime) {
		this.releaseTime = releaseTime;
	}

	/**
	 * 上传者
	 */
	public int getAdminId() {
		return adminId;
	}
	/**
	 * 上传者
	 */
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	/**
	 * 文件描述
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * 文件描述
	 */
	public void setDescription(String description) {
		this.description = description;
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
	
	
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
}