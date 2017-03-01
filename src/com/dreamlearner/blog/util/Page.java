package com.dreamlearner.blog.util;

import java.util.List;

/**
 * 分页
 * 
 * @author Long
 * 
 *         2017年1月16日 上午9:41:17
 */
public class Page<T> {

	private int currentPage; // 当前页
	private int pageSize = Constants.PAGE_SIZE; // 一页显示记录数
	private int totalPageNum; // 总页数
	private int totalResults; // 总记录数
	private int startIndex; // 起始索引

	private List<T> results; // 存放的数据

	public Page(int currentPage, int totalResults) {
		this.totalResults = totalResults;
		
		if (this.totalResults % pageSize == 0) {
			this.totalPageNum = this.totalResults / pageSize;
		} else {
			this.totalPageNum = this.totalResults / pageSize + 1;
		}
		
		this.currentPage = currentPage > totalPageNum? totalPageNum: currentPage;
		
		this.startIndex = (this.currentPage - 1) * pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public int getTotalResults() {
		return totalResults;
	}

	public void setTotalResults(int totalResults) {
		this.totalResults = totalResults;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public List<T> getResults() {
		return results;
	}

	public void setResults(List<T> results) {
		this.results = results;
	}

}
