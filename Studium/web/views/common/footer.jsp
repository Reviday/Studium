<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <footer class="site-footer" role="contentinfo">
    <div class="container">
      <div class="row mb-5">
        <div class="col-md-4 mb-5">
          <h3>About Us</h3>
          <p class="mb-5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus et dolor blanditiis
            consequuntur ex voluptates perspiciatis omnis unde minima expedita.</p>
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
            <li><a href="#">About</a></li>
            <li><a href="#">Terms of Use</a></li>
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
              href="https://www.naver.com" target="_blank">STUDIUM</a>
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
</body>

</html>