package common.template;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

// 명칭 중복으로 댓글용 Template을 추가
// 추후, 디자인 변경 고려
public class CmtPaginationTemplate {
	
	/***********************************
	 * 페이징 처리에 필요한 변수 
	 * 1. cPage : 현재 페이지 
	 * 2. numPerPage : 테이블(page)에 출력될 데이터의 수 
	 * 3. totalDate : 현재 총 데이터의 수 
	 * 4. totalPage : 전체 페이지 수 (나머지 올림) 
	 * ----- 페이지바를 구성하는 변수
	 * 5. pageNo : 페이지바에서 페이지 값 출력해주는 변수 
	 * 6. pageEnd : 페이지바에서 페이지값의 끝 번호 
	 * 7. pageBarSize : 페이지바에서 페이지값이 출력되는 갯수 
	 * 8. pageBar : 페이지바를 구성하는 코드를 누적시키는 변수
	 * 
	 * 페이징 처리시 계산공식
	 * 1. totalPage : (int)ceil(totalData / numPerPage) // 무조건 올림처리 
	 * 2. 시작번호 : (cPage-1)*numPerPage+1 
	 * 3. 끝번호 : cPage*numPerPage 
	 * 4. 페이지시작번호 : ((cPage-1)/pageBarSize)*pageBarSize+1;
	 ************************************/
	private int cPage;
	private int numPerPage;
	private String pageBar;
	private int totalPage;
	private int pageBarSize;
	private int pageNo;
	private int pageEnd;
	
	// 페이지 번호로 Parameter를 넘기기 위해 사용한다.
	private Map<String, String> attributes=new HashMap<String, String>();
	// 매핑용 변수
	private String URLmapping; 
	
	/*
	 * 페이징 처리를 template을 만들어 사용하기위해
	 * 기본적인 인수로 서블렛으로부터 request를 전달받고
	 * 데이터의 총 갯수인 totalData와
	 * 해당 페이지로의 매핑을 위한 URLmapping값을 전달받는다.
	 */
	public CmtPaginationTemplate (HttpServletRequest request, int totalData, String URLmapping)  
	{
		// 페이지 설정
		try {
			this.cPage = Integer.parseInt(request.getParameter("cmtCPage"));
		} catch (NumberFormatException e) {
			this.cPage = 1;
		}
		
		try {
			this.numPerPage=Integer.parseInt(request.getParameter("cmtNumPerPage"));
		} catch (NumberFormatException e) {
			this.numPerPage = 30;
		}
		
		// 페이징 처리
		totalPage=(int) Math.ceil((double) totalData / this.numPerPage);
		this.pageBarSize=10;
		pageNo=((this.cPage - 1) / pageBarSize) * pageBarSize + 1;
		pageEnd=pageNo + pageBarSize - 1;
		pageBar="";
		
		// URLmapping
		this.URLmapping = request.getContextPath()+URLmapping;
	}
	
	private String setPageBar(String URLmapping, Map<String, String> attributes) 
	{
		// pageBar 소스코드 작성!
		String queryString=""; // QueryString 누적용 변수
		
		// 우선, attributes에 설정된 QueryString이 있는지 확인하고, 있으면 QueryString으로 만들어준다.
		if(!attributes.isEmpty()) {
			for(String key : attributes.keySet()) {
				queryString+="&"+key+"="+attributes.get(key);
			}
		}
		
		// 처음페이지 pagination
		if(pageNo <= pageBarSize) {
			pageBar += "<li><a>처음 페이지</a></li>";
		} else {
			pageBar += "<li><a href='"+ URLmapping +"?cmtCPage=1&cmtNumPerPage=" 
						+ numPerPage + queryString + " class='first'>처음 페이지</a></li>";
		}
		
		// 이전 pagination
		if(pageNo == 1) {
			pageBar += "<li><a><<</a></li>";
		} else {
			pageBar += "<li><a href='" + URLmapping +"?cmtCPage=" + (pageNo - 1) 
						+ "&cmtNumPerPage=" + numPerPage + queryString + "' class='arrow left'><<</a></li>";
		}
		
		// 페이지 pagination
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li><a class='active num'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<li><a href='"+ URLmapping + "?cmtCPage=" + pageNo 
							+ "&cmtNumPerPage=" + numPerPage + queryString + "' class='num'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}

		// 다음 pagination
		if (pageNo > totalPage) {
			pageBar += "<li><a>>></a></li>";
		} else {
			pageBar += "<li><a href='"+ URLmapping + "?cmtCPage=" + pageNo 
						+ "&cmtNumPerPage=" + numPerPage + queryString + "' class='arrow right'>>></a></li>";
		}
		
		
		// 끝 페이지 pagination
		if((pageEnd-1)/pageBarSize == (totalPage-1)/pageBarSize) {
			pageBar += "<li><a>끝 페이지</a></li>";
		} else {
			pageBar += "<li><a href='"+ URLmapping +"?cmtCPage=" + totalPage
						+ "&cmtNumPerPage=" + numPerPage + queryString + "' class='last'>끝 페이지</a></li>";
		}
		
		return pageBar;
	}
	
	//넘겨줄 파라미터 값을 설정하는 함수
	//넘겨줄 값이 없으면 추가하지 않아도 된다.
	//쿼리스트링으로 넘겨주는 값은 무조건 String 이므로 유의하도록 한다.
	public void setQueryString(String key, Object value) 
	{
		attributes.put(key, String.valueOf(value));
	}
	
	//처리된 값을 반환 받을 getter
	public int getcPage() {
		return cPage;
	}

	public int getNumPerPage() {
		return numPerPage;
	}
	
	public String getPageBar() {
		// 페이지 바 만들기
		pageBar=setPageBar(URLmapping, attributes);
		return pageBar;
	}

}
