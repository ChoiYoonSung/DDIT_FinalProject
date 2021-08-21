<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
.text-indigo, .text-indigo-500 {
    color: yellow!important;
}
</style>
<body style="background-color: #f0f4f7;">
	<div class="app-content">
		<div class="row">
			<div class="page-title has-bg" style="padding: 0px">
				<h1 style="color: black;">&nbsp;시스템 이용 가이드</h1>
			</div>
		</div>
		<div>
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a href="#default-tab-1" data-bs-toggle="tab" class="nav-link active"> 
						<span class="d-sm-none">Tab 1</span>
						<span class="d-sm-block d-none">공통</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="#default-tab-2" data-bs-toggle="tab" class="nav-link"> 
						<span class="d-sm-none">Tab 2</span>
						<span class="d-sm-block d-none">프로젝트 관리</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="#default-tab-3" data-bs-toggle="tab" class="nav-link">
						<span class="d-sm-none">Tab 3</span>
						<span class="d-sm-block d-none">지식 관리</span>
					</a>
				</li>
			</ul>
			<div class="tab-content bg-white p-3">
			
				<div class="tab-pane fade active show" id="default-tab-1">
					<div class="accordion" id="accordion_c">
						<div class="accordion-item border-0">
							<div class="accordion-header" id="headingOne">
								<div style="text-align: center; background-color: white;">
									<br>
									<h4>KAPMaS 공통 이용 가이드</h4>
									<span>시스템 이용 공통</span>
									<br>
									<br>
								</div>
							</div>
							<c:forEach items="${commonGuideList}" var="com" varStatus="status_c">
								<div class="accordizon-item border-0">
									<div class="accordion-header" id="headingTwo">
										<button class="accordion-button bg-gray-900 text-white px-3 pt-10px pb-10px pointer-cursor collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_c_${status_c.index}" aria-expanded="false">
											<i class="fa fa-circle fa-fw text-indigo me-2 fs-8px"></i>
											${com.sgTitle }
										</button>
									</div>
									<div id="collapse_c_${status_c.index}" class="accordion-collapse collapse" data-bs-parent="#accordion_c" style="">
										<div class="accordion-body bg-gray-800 text-white">
											<textarea class="accordion-body bg-gray-800 text-white" style="border: none; width: 100%; height: 150px; overflow: auto; resize: none;" readonly="readonly">${com.sgContent}</textarea>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<div class="tab-pane fade" id="default-tab-2">
					<div class="accordion" id="accordion_p">
						<div class="accordion-item border-0">
							<div class="accordion-header" id="headingOne">
								<div style="text-align: center; background-color: white;">
									<br>
									<h4>KAPMaS PMS 이용 가이드</h4>
									<span>프로젝트 관리 이용</span> <br> <br>
								</div>
							</div>
							<c:forEach items="${projectGuideList}" var="pro" varStatus="status_p">
								<div class="accordizon-item border-0">
									<div class="accordion-header" id="headingTwo">
										<button class="accordion-button bg-gray-900 text-white px-3 pt-10px pb-10px pointer-cursor collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_p_${status_p.index}" aria-expanded="false">
											<i class="fa fa-circle fa-fw text-indigo me-2 fs-8px"></i>
											${pro.sgTitle}
										</button>
									</div>
									<div id="collapse_p_${status_p.index}" class="accordion-collapse collapse" data-bs-parent="#accordion_p" style="">
										<div class="accordion-body bg-gray-800 text-white">
											<textarea class="accordion-body bg-gray-800 text-white" style="border: none; width: 100%; height: 150px; overflow: auto; resize: none;" readonly="readonly">${pro.sgContent}</textarea>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="default-tab-3">
					<div class="accordion" id="accordion_k">
						<div class="accordion-item border-0">
							<div class="accordion-header" id="headingOne">
								<div style="text-align: center; background-color: white;">
									<br>
									<h4>KAPMaS KMS 이용 가이드</h4>
									<span>지식 관리 이용</span> <br> <br>
								</div>
							</div>
							<c:forEach items="${knowledgeGuideList}" var="know" varStatus="status_k">
								<div class="accordion-item border-0">
									<div class="accordion-header" id="headingTwo">
										<button class="accordion-button bg-gray-900 text-white px-3 pt-10px pb-10px pointer-cursor collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_k_${status_k.index}" aria-expanded="false">
											<i class="fa fa-circle fa-fw text-indigo me-2 fs-8px"></i>
											${know.sgTitle}
										</button>
									</div>
									<div id="collapse_k_${status_k.index}" class="accordion-collapse collapse" data-bs-parent="#accordion_k" style="">
										<div class="accordion-body bg-gray-800 text-white">
											<textarea class="accordion-body bg-gray-800 text-white" style="border: none; width: 100%; height: 150px; overflow: auto; resize: none;" readonly="readonly">${know.sgContent}</textarea>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>