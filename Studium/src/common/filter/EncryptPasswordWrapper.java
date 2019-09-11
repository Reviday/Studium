package common.filter;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptPasswordWrapper extends HttpServletRequestWrapper {

	public EncryptPasswordWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getParameter(String key) {
		// TODO Auto-generated method stub
		String value="";
		if(key!=null && key.equals("password") || key.equals("pwd")) {
			value=getEncryptSHA512(super.getParameter(key));
		} else {
			value=super.getParameter(key);
		}
		return value;
	}
	
	private static String getEncryptSHA512(String pw) {
		MessageDigest md=null;
		try {
			/* 알고리즘 종류
			 * MD2 : RFC 1319에 정의 된 MD2 메시지 다이제스트 알고리즘
			 * MD5 : RFC 1321에 정의 된 MD5 메시지 다이제스트 알고리즘
			 * 
			 * SHA-1, SHA-256, SHA-384, SHA-512 
			 * : FIPS PUB 180-2에 정의 된 해시 알고리즘.
			 * SHA-256은 충돌 공격에 대해 128 비트 보안을 제공하기위한 256 비트 해시 기능이며 
			 * SHA-512는 256 비트 보안을 제공하기위한 512 비트 해시 기능이다. 
			 * SHA-512 출력을 잘라서 384 비트 해시를 얻을 수 있다.
			 * 
			 * # MD5 (Message-Digest algorithm 5) 
			 * : MD5는 메세지 축약 알고리즘으로써, 파일 무결성 검사용도로 많이 쓰이고 있다.
			 * 128bit 의 해쉬를 제공하며, 암호와와 복호화를 통하여 보안용도로도 많이 쓰인다.
			 * 하지만 암호화 결함이 발견되어 보안 용도로 사용할때에는 SHA와 같은 다른 알고리즘을 사용하는것이 권장되고 있다고 한다. 
			 * 
			 * # SHA (Sechre Hash Standard)
			 * SHA(Secure Hash Algorithm, 안전한 해시 알고리즘) 
			 * 함수들은 서로 관련된 암호학적 해시 함수들의 모음이다. 
			 * 여러 종류가 존재하며 그중 SHA-1은 SHA 함수들 중 가장 많이 쓰이며, 
			 * TLS, SSL, PGP, SSH, IPSec 등 많은 보안 프로토콜과 프로그램 에서 사용되고 있다.
			 * SHA-1은 이전에 널리 사용되던 MD5를 대신해서 쓰이기도 한다. 
			 * 혹자는 좀 더 중요한 기술에는 SHA-256이나 그 이상의 알고리즘을 사용할 것을 권장한다.
			 */
			
			// SHA-512와 일치하는 MessageDigest 인스턴스를 가져와 md에 저장.
			md=MessageDigest.getInstance("SHA-512");
		} catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// byte 배열을 만들어서 - 암호화는 비트단위(바이트)로 이루어짐
		byte[] bytes;
		try {
			// 유니코드 문자열(String)을 바이트코드로 인코딩
			bytes=pw.getBytes("UTF-8");
			// 지정된 바이트 배열을 사용하여 다이제스트를 업데이트한다.
			md.update(bytes);
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// Base64 : 64문자의 영숫자를 이용하여 멀티 바이트 문자열이나 이진 데이터를 다루기 위한 인코딩 방식
		String encSHA=Base64.getEncoder().encodeToString(md.digest());
		// 인코딩된 문자열 반환
		return encSHA;
	}
}
