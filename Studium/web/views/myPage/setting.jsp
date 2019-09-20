<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.studium.member.model.vo.Member"%>
<% 
	Member m=(Member)request.getAttribute("member");

%>
 
<style>
.header-background-cover {
	height: 95px;
	background-color: rgba(0, 0, 0, 0.8);
}
</style>

    <!-- 버튼 -->    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,500,700&amp;display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/setting.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/107/three.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>


<section>
	<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>
	

    <div class="section-content">
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8 navbar-myMenu">

                <div class="setting">
                    <h5>환경설정</h5>
                    <div class="row setting-divide">
                        <div class="col-7">
                            <p class="check-i">이메일 인증 상태<br>
                                <span>이메일 인증을 완료해주세요!</span>
                            </p>

                        </div>
                        <div class="col-5">
                            <div class="switchForm">
                                <label class="switch">
                                        <input type="checkbox">
                                            <div>
                                                <canvas></canvas>
                                            </div>
                                    </label>
                            </div>
                        </div>
                    </div>
                    <div class="row setting-divide">
                        <div class="col-7">
                            <p class="check-i">이메일 수신</p>

                        </div>
                        <div class="col-5">
                            <div class="switchForm">
                                <label class="switch">
                                            <input type="checkbox">
                                                <div>
                                                    <canvas></canvas>
                                                </div>
                                        </label>
                            </div>
                        </div>
                    </div>
                    <div class="row setting-divide">
                        <div class="col-7">
                            <p class="check-i">쪽지 사용</p>
                        </div>
                        <div class="col-5">
                            <div class="switchForm">
                                <label class="switch">
                                                <input type="checkbox">
                                                    <div>
                                                        <canvas></canvas>
                                                    </div>
                                            </label>
                            </div>
                        </div>
                    </div>
                    <div class="row setting-divide">
                        <div class="col-7">
                            <p class="check-i">문자 수신</p>
                        </div>
                        <div class="col-5">
                            <div class="switchForm">
                                <label class="switch">
                                                    <input type="checkbox">
                                                        <div>
                                                            <canvas></canvas>
                                                        </div>
                                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row setting-divide">
                        <div class="col-7">
                            <p class="check-i">프로필 공개 </p>
                        </div>
                        <div class="col-5">
                            <div class="switchForm">
                                <label class="switch">
                                     <input type="checkbox">
                                        <div>
                                             <canvas></canvas>
                                                </div>
                             </label>
                            </div>
                        </div>
                    </div>


                    <div>
                        <input type="submit" onclick="modifyMember_validate()" class="btn-sm btn-changeSetting" value="수정하기">

                    </div>

                </div>



            </div>
            <div class="col-sm-2"></div>

        </div>

    </div>


    <!-- dribbble 우측상단 고정-->
    <!-- <a class="dribbble" href="https://dribbble.com/shots/7063524-3D-Switch-animation" target="_blank"><img src="https://cdn.dribbble.com/assets/dribbble-ball-mark-2bd45f09c2fb58dbbfb44766d5d1d07c5a12972d602ef8b32204d28fa3dda554.svg" alt=""></a> -->









    <!-- 버튼 스크립트 -->



    <!-- 버튼 스크립트 -->
    <script>
        $('.switch').each(function() {
            let toggle = $(this),
                input = toggle.children('input'),
                $canvas = toggle.find('canvas'),
                canvas = $canvas[0],
                renderer = new THREE.WebGLRenderer({
                    canvas: canvas,
                    context: canvas.getContext('webgl2'),
                    antialias: true,
                    alpha: true
                });
            renderer.setSize(25, 25); /*안에 동그란 버튼 사이즈*/
            renderer.setPixelRatio(window.devicePixelRatio ? window.devicePixelRatio * 2 : 2);
            renderer.shadowMap.enabled = true;
            let scene = new THREE.Scene();
            camera = new THREE.PerspectiveCamera(45, $canvas.width() /
                $canvas.height(), 0.1, 1000);
            camera.position.z = 92;
            let shape = new THREE.CylinderGeometry(16, 16, 8, 20);
            let material = new THREE.MeshPhongMaterial({
                color: 0xE4ECFA,
                shininess: 20,
                opacity: .96,
                transparent: true
            });
            let donut = new THREE.Mesh(shape,
                material);
            scene.add(donut);
            let lightTop = new THREE.DirectionalLight(0xFFFFFF, .6);
            lightTop.position.set(0, 80, 60);
            lightTop.castShadow = true;
            scene.add(lightTop);
            let right = new THREE.DirectionalLight(0xFFFFFF, .5);
            right.position.set(20,
                20, 40);
            right.castShadow = true;
            scene.add(right);
            let left = new THREE.DirectionalLight(0xFFFFFF, .5);
            left.position.set(-20, 20, 40);
            left.castShadow = true;
            scene.add(left);
            let active = new THREE.DirectionalLight(0x275EFE, .8);
            active.position.set(0, -80, 20);
            active.castShadow = true;
            scene.add(active);
            scene.add(new THREE.AmbientLight(0x6C7486));
            var render = function() {
                requestAnimationFrame(render);
                TweenMax.render();
                renderer.render(scene, camera);
            };
            render();
            input.on('change', e => {
                let checked = input.is(':checked'),
                    z = !checked ? THREE.Math.degToRad(0) : THREE.Math.degToRad(90),
                    x = !checked ? THREE.Math.degToRad(90) : THREE.Math.degToRad(0);
                TweenMax.to(donut.rotation, 3, {
                    ease: Elastic.easeOut.config(!checked ? 1.16 :
                        1.04, !checked ? .32 : .36),
                    z: z,
                    x: x
                });
                active.intensity = !checked ? .4 : .8;
                active.color.setHex(!checked ? 0xFFFFFF : 0x275EFE);
            }).trigger('change');
        });
    </script>


</section>

<%@ include file="/views/common/footer.jsp"%>
