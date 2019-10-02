<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <footer class="site-footer" role="contentinfo">
    <div class="container">
      <div class="row mb-5">
        <div class="col-md-4 mb-5">
          <h3>About Us</h3>
          <p class="mb-5">STUDIUM에서는 '모든 배움의 첫 시작'인 <br>
          				  '흥미 붙이기'를 목표로 합니다. <br>
          				  STUDIUM은 '사람 중심의 커뮤니티'에서 <br>
          				    가장 큰 즐거움이 온다고 믿습니다.</p>
          <ul class="list-unstyled footer-link d-flex footer-social">
            <li><a href="#" class="p-2"><span class="fa fa-twitter"></span></a></li>
            <li><a href="#" class="p-2"><span class="fa fa-facebook"></span></a></li>
            <li><a href="#" class="p-2"><span class="fa fa-linkedin"></span></a></li>
            <li><a href="#" class="p-2"><span class="fa fa-instagram"></span></a></li>
          </ul>

        </div>
        <div class="col-md-5 mb-5">
          <div class="mb-5">
            <h3>상담가능시간</h3>
            <p><strong class="d-block">Monday-Thursday</strong> 10AM - 4PM</p>
          </div>
          <div>
            <h3>Contact Info</h3>
            <ul class="list-unstyled footer-link">
              <li class="d-block">
                <span class="d-block">Address:</span>
                <span class="text-white">서울시 강남구 129-3</span></li>
              <li class="d-block"><span class="d-block">Telephone:</span><span class="text-white">+82 10 4942
                  2900</span></li>
              <li class="d-block"><span class="d-block">Email:</span><span class="text-white">info@gmail.com</span></li>
            </ul>
          </div>
        </div>
        <div class="col-md-3 mb-5">
          <h3>Quick Links</h3>
          <ul class="list-unstyled footer-link">
            <li><a href="<%=request.getContextPath()%>/QnAShow">자주묻는 질문</a></li>
            <li><a href="<%=request.getContextPath()%>/views/Q&A/leaderIntro.jsp">강사/리더 신청</a></li>
            <li><a href="#">Disclaimers</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </div>
        <div class="col-md-3">

        </div>
      </div>
      <div class="row">
        <div class="col-12 text-md-center text-left">
          <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>
              document.write(new Date().getFullYear());
            </script> All rights reserved <i class="fa fa-heart" aria-hidden="true"></i> by <a
              href="http://rclass.iptime.org:9999/Studium/" target="_blank">STUDIUM</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
        </div>
      </div>
    </div>
  </footer>
  <!-- END footer -->

  <!-- loader -->
  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
        stroke="#cf1d16" /></svg></div>

  <!-- <script src="js/jquery-3.2.1.min.js"></script> -->
  
  <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/jquery.waypoints.min.js"></script>

  <script src="<%=request.getContextPath() %>/js/jquery.magnific-popup.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/magnific-popup-options.js"></script>


  <script src="<%=request.getContextPath() %>/js/main.js"></script>
   <script>
        AOS.init();
    </script>

</body>

</html>