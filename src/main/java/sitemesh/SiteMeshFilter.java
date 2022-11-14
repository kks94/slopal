package sitemesh;

import javax.servlet.annotation.WebFilter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
/*
 * sitemesh 설정 : 화면의 공통부분을 설정
 * 1. pom.xml에 sitemesh 관련 부분 설정 => sitemesh-3.0.1.jar 파일
 * 2. layout 폴더에 kiclayout.jsp 생성 (템플릿 복붙)

@WebFilter("/*") : 모든 요청시 해당 필터(sitemesh)가 실행
 */
@WebFilter("/*") //모든 url 요청에 대해 sitemesh 실행
public class SiteMeshFilter extends ConfigurableSiteMeshFilter {
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/*", "/layout/slopallayout.jsp")
		.addExcludedPath("/user/idsearch*")
		.addExcludedPath("/user/pwsearch*");
	}
}
