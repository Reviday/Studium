package common.policy;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class StudiumFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File origin) {

		File newFile=null;
		do {
			//날짜(시간)+임의값으로 rename 설정
			long currentTime=System.currentTimeMillis();
			SimpleDateFormat sf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)(Math.random()*1000);
			
			//파일명처리하기
			String originName=origin.getName();
			int point=originName.lastIndexOf(".");
			String ext="";
			//파일형식가져오기
			if(point>-1) {
				ext=originName.substring(point);
			}
			//새파일생성 파일이름=Studium_현재시간_랜덤숫자.파일형식
			String newName="Studium_"+sf.format(new Date(currentTime))
					+"_"+rndNum+ext;
			
			newFile=new File(origin.getParent(),newName);
			
			
		}while(!createNew(newFile));
		
		
		return newFile;
	}
	
	private boolean createNew(File newFile) {
		try {
			return newFile.createNewFile();
		}catch(IOException e){
			return false;
		}
	}
}




