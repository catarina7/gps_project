package com.game.util;

public class PageMaker {

	private int startRowNum;
	private int lastRowNum;
	private int curBlock;
	private int totalBlock;
	private int startNum;
	private int lastNum;
	private int curPage;
	private int perPage;

	

	//rownum
	public void makeRow(){
		this.startRowNum= (curPage-1)*perPage+1;
		this.lastRowNum = curPage*perPage;
		System.out.println(startRowNum);
		System.out.println(lastRowNum);
	}

	//pageing
	public void makePage(int totalCount){

		//1. 전체 게시물 수 - 매개변수
		
		//2. 전체Page

		int totalPage=0;
		if(totalCount%perPage==0){
			totalPage=totalCount/perPage;
		}else {
			totalPage=totalCount/perPage+1;
		}
		System.out.println("토탈페이지 : "+totalPage);
		//3. 전체 Block

		//3. 전체Block

		int perBlock=5;
		this.totalBlock=0;
		if(totalPage%perBlock==0){
			totalBlock=totalPage/perBlock;
		}else {
			totalBlock=totalPage/perBlock+1;
		}
		System.out.println("토탈 블럭 : " + totalBlock);
		//4. curBlock
		this.curBlock=0;
		if(curPage%perBlock==0){
			curBlock=curPage/perBlock;
		}else {
			curBlock=curPage/perBlock+1;
		}
		System.out.println("curBlock : " +curBlock);
		//5. startNum, lastNum
		this.startNum=(curBlock-1)*perBlock+1;
		this.lastNum = curBlock*perBlock;
		System.out.println("startNum"+startNum+"lastNum"+lastNum);
		//
		if(curBlock==totalBlock){
			lastNum = totalPage;
		}
	}

	public int getCurPage() {
		return curPage;
	}



	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}


	public int getPerPage() {
		return perPage;
	}


	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}



	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getLastRowNum() {
		return lastRowNum;
	}

	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}

}
