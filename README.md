
<a name="readme-top"></a>

<!-- ABOUT THE PROJECT -->
## GiftBox_Project 쇼핑몰 구성

첫 학원 교육을 수료후, 미약하지만 배운 Spring 사용법, JSP 템플릿 사용법, Oracle과 Mybatis의 활용방법을 익혀 개인적으로 MVC 패턴에 맞게 쇼핑몰을 구성해보는 프로젝트

해당 프로젝트를 진행하는 이유:
* 내가 배운것들을 내 힘으로 사용하고, 구현하고 배포해보는 것
* 기본적인 CRUD부터, API활용과 기본적인 HTML CSS구성, 화면 설계, DB의 활용도를 테스트해 볼 수 있음

위와 같은 이유들로, 해당 프로젝트를 구현하고 테스트해보려고 한다.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### 사용한 기술들

* [![Bootstrap][Bootstrap.com]][Bootstrap-url]
* [![JQuery][JQuery.com]][JQuery-url]
* <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
* <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## 로드맵

- [x] View단 완성
   - [x] JSP를 이용하기 전 정적 페이지 완성 
- [x] Model 구성 (mybaits 사용)
- [x] Controller 로직 구성
   - [x] html로 구성된 페이지에 JSP를 이용하여 
- [x] DB 테스트
   - [x] 정상적인 데이터 INSERT
- [x] 버그 테스트

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## 프로젝트 진행

Maven과 JSP Mybatis를 사용한 프로젝트는 조금 오래된 느낌이 있다. 옛날부터 사용했던 기술들이고, 요즘 흔히 사용되는 설정은 아니다. 하지만 그만큼 많은 정보가 있었고, 편리해지지 않은 정도로 조금 더 본질적으로 어떻게 돌아가는지 알 수 있는 설정이라고 생각했다.

혼자서 진행하면 편한점이 있다. 의견충돌이 발생하지 않고, 일정 조정이 쉽다. 경로 수정이 쉽고 형상관리가 용이하다. 물론 그만큼 근 단점이 존재한다. 의견을 조율하는 법을 습득하지 못하고, 일정을 효율좋게 조정하는 법을 알기 힘들고, 형상 관리 프로그램의 활용도를 체크하기 힘들다.

팀 프로젝트 같은 경우 각자 역할을 구분하기 때문에 하나부터 열까지 진행해보기 힘들다는 부분이 있기 때문에 좋은 경험이었다. CRUD의 반복이고, 특별한 기능이 없는 프로젝트, 페이지지만 널리 쓰이는 간단한 폼들의 컨트롤을 해본것도 큰 도움이 됐다고 생각한다. 서버단에서 차리하는 코드 혹은 클라이언트에서 처리할 코드들을 구분하는 것이 힘들고 어느 부분이 더 좋은 점인지 아는 것은 조금 힘들었다.


## 각 페이지별 요구기능

* 관리자 페이지
 * 판매자를 등록할 수 있음
 * 주문 목록을 조회할 수 있음
 * 주문 상태를 조회할 수 있음 ( 배송중, 배송준비 )
 * 회원을 관리할수 있음

* 유저 페이지
 * 상품을 조회할 수 있음
 * 상품을 구매(api)할 수 있음
 * 구매한 상품에 대한 리뷰를 작성할 수 있음
 * 회원가입, 로그인 기능

   

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 프로젝트 완료 KPT 회고

* KEEP
   * 프로젝트 구성 중 요구서, 명확한 기술서를 작성하고 개발을 진행하니 개발 방향이 뚜렷하고 효율적인 개발이 가능했다.



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
