<template>
  <div id="allEventComponent">
        <nav>
            <div class="whatsthisnavbarhavenaa">
                <a href="main.html"><div class="circle"></div></a>
                <div class="menu">
                    <a href="main.html" class="nav-color"> หน้าแรก</a>
                    <span>&nbsp;&nbsp;&nbsp;&gt;</span>
                    <a href="zone-1.html" class="nav-color"> &nbsp; เลือกรอบการแสดง</a>
                    <span>&nbsp;&nbsp;&nbsp;&gt;</span>
                    <a style="color: #eee; cursor: context-menu;"> &nbsp; การสั่งซื้อ </a>
                </div>
                <div class="void"></div>
                <a href="profile.html"><div class="circle" >A</div></a>
            </div>
        </nav>
        <div id="container">
            <div id="seat-box"></div>
            <div id="rate">
                <h3>{{allevents[0].name}}</h3>
                <div class="line"></div>
                <div class="detail">
                    <div>รอบการแสดง</div>
                    <div class="detail-info">{{allevents[0].date}}</div>
                    <div>โซนที่นั่ง</div>     
                    <div class="detail-info">{{zone}}</div>
                    <div>สถานะ</div>     
                    <div class="detail-info">{{status}}</div>
                    <div>ราคาบัตร</div>   
                    <div class="detail-info">{{allevents[0].price}}</div>
                    <div>จำนวนที่นั่ง</div>   
                    <div class="detail-info">{{seat}}</div>
                    <div>เลขที่นั่ง</div>    
                    <div class="detail-info">{{num_seat}}</div>
                </div>
                <div class="btn">
                    <a href="complete-buy.html "><button class="confirm">ยืนยันการซื้อบัตร</button></a>
                    <a href="zone-1.html"><button class="other-zone">โซนอื่น ๆ</button></a>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
// import axios from "axios";

import profile from "../assets/img/profile.png";
import poster1 from "../assets/img/poster_01.jpg";
import poster2 from "../assets/img/poster_02.jpg";
import poster3 from "../assets/img/poster_03.jpg";
import poster4 from "../assets/img/poster_04.png";
import poster5 from "../assets/img/poster_05.jpg";
import poster6 from "../assets/img/poster_06.jpg";
import poster7 from "../assets/img/poster_07.jpg";
export default {
  data() {
    return {
      statuslog: true,
      user: "Manee",
      email: "นกแก้ว@กินองุ่น.คอม",
      phone: "012345678",
      dis: profile,
      openmenu: false,

      seat_empty: 20,
      zone: "A",
      status: "AVAILABLE",
      seat: 1,
      num_seat: "000",
      code_seat: "00000000000",

      page: "all",
      sta_edit: "edited",
      pop_login: "hide",
      login: "used",
      user_status: "anonymous",

      username: "",
      password: "",

      add_edit: "edited",

      account_user: "",
      create_account_user: true,
      create_account_user_info: true,
      account_pass: "",
      create_account_pass: true,
      account_email: "",
      create_account_email: true,
      create_account_email_info: true,
      account_name: "",
      create_account_name: true,
      account_sur: "",
      create_account_sur: true,
      account_gender: "",
      create_account_gender: true,
      account_phone: "",
      create_account_phone: true,
      account_birth: "",
      create_account_birth: true,
      account_address: "",
      create_account_address: true,
      account_postal: "",
      create_account_postal: true,

      qrcode: "",
      pathqr: "hellowelcome",

      info: [
        {
          user: "manee",
          pass: "1234",
          email: "123456@",
        },
      ],

      searchName: "",
      newData: [
        {
          id: "01",
          name: "BOWKYLION LANTA CONCERT",
          price: "2000",
          date: "18 Fabuary 2023",
          hall: "ธันเดอร์โดม เมืองทองธานี",
          status: "now",
          poster: poster1,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "02",
          name: "YourMOOD x MIRRR x แลก BKK Concert",
          price: "1800",
          date: "27 December 2022",
          hall: "แลก BKK",
          status: "out",
          poster: poster2,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "03",
          name: "BLACKPINK BORN PINK World tour Bangkok",
          price: "1000",
          date: "27 March 2023 - 28 March 2023",
          hall: "สนามราชมังคลากีฬาสถาน",
          status: "now",
          poster: poster3,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "04",
          name: "In the Studio with 2 Days Ago Kids",
          price: "1200",
          date: "1 April 2023",
          hall: "SEARCH STUDIO รามคำแหง 81",
          status: "now",
          poster: poster4,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "05",
          name: "2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK",
          price: "1390",
          date: "8 April 2023",
          hall: "รอยัล พารากอน ฮอลล์",
          status: "now",
          poster: poster5,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "06",
          name: "ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK",
          price: "1000",
          date: "8 April 2023",
          hall: "ธันเดอร์โดม เมืองทองธานี",
          status: "soon",
          poster: poster6,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "07",
          name: "INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร ",
          price: "1100",
          date: "31 August 2023",
          hall: "IMPACT ARENA",
          status: "out",
          poster: poster7,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "true",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
      ],

      check_account_user: null,
      check_account_pass: null,
      allevents: [
        {
          id: "01",
          name: "BOWKYLION LANTA CONCERT",
          price: "2000",
          date: "18 Fabuary 2023",
          hall: "ธันเดอร์โดม เมืองทองธานี",
          status: "now",
          poster: poster1,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "02",
          name: "YourMOOD x MIRRR x แลก BKK Concert",
          price: "1800",
          date: "27 December 2022",
          hall: "แลก BKK",
          status: "out",
          poster: poster2,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "03",
          name: "BLACKPINK BORN PINK World tour Bangkok",
          price: "1000",
          date: "27 March 2023 - 28 March 2023",
          hall: "สนามราชมังคลากีฬาสถาน",
          status: "now",
          poster: poster3,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "04",
          name: "In the Studio with 2 Days Ago Kids",
          price: "1200",
          date: "1 April 2023",
          hall: "SEARCH STUDIO รามคำแหง 81",
          status: "now",
          poster: poster4,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "05",
          name: "2023 JI CHANG WOOK FAN MEETING < REACH YOU > in BANGKOK",
          price: "1390",
          date: "8 April 2023",
          hall: "รอยัล พารากอน ฮอลล์",
          status: "now",
          poster: poster5,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "06",
          name: "ITZY THE 1ST WORLD TOUR < CHECKMATE > BANGKOK",
          price: "1000",
          date: "8 April 2023",
          hall: "ธันเดอร์โดม เมืองทองธานี",
          status: "soon",
          poster: poster6,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "false",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
        {
          id: "07",
          name: "INKSYLAND ดินเเดนขยี้ใจ คอนเสิร์ตครั้งใหญ่ ก้าวใหม่ของ อิ้งค์ วรันธร ",
          price: "1100",
          date: "31 August 2023",
          hall: "IMPACT ARENA",
          status: "out",
          poster: poster7,
          description:
            "“ คนใหม่เขาดูแลอยู่ ” ซิงเกิลที่ 2 จากอิ้งค์ วรันธร ที่สะท้อนความรู้สึกของคนที่ถึงเวลาต้องมูฟออนแล้วโดยเพลงนี้ อิ้งค์ ได้ไอเดียมาจากการที่เพลงช้าของอัลบั้มที่แล้ว มักจะพูดถึงการมูฟออนเป็นวงกลม เหมือนจะลืมแต่ไม่ลืม อยากเริ่มต้นใหม่แต่ก็อยากเริ่มกับคนเดิม แต่เมื่อมาถึงความรู้สึกตอนนี้ ก็อยากจะพูดในมุมมองที่เติบโตและเข้าใจมากขึ้นว่าถึงเวลาต้องปล่อยมือและก้าวออกมา ปล่อยให้คนใหม่เขาดูแลได้แล้ว",
          carousel: "true",
          carousellink:
            "https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1",
        },
      ],
      historys: [
        {
          id: "02",
        },
        {
          id: "05",
        },

        {
          id: "03",
        },
        {
          id: "01",
        },
        {
          id: "03",
        },
        {
          id: "04",
        },
        {
          id: "05",
        },
      ],
    };
  },
  created() {
    // axios
    //   .get("http://localhost:3000/", { params: { search: this.search } })
    //   .then((response) => {
    //     this.blogs = response.data.blogs;
    //     // console.log(this.blogs)
    //   })
    //   .catch((err) => {
    //     console.log(err);
    //   });
  },
  methods: {
    async loginnn() {
      //เช็คว่า user กับ pass ที่กรอกมาตรงกับข้อมูลที่ตรงไหม
      if (this.username == "" && this.password == "") {
        alert("กรุณาใส่ข้อมูล");
      } else {
        //ถ้า user ผิด
        const bodyForm = {
          username: this.username,
          password: this.password,
        };

        const response = await fetch("http://localhost:3000/auth/login", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(bodyForm),
        });

        const storeResponseJson = await response.json();
        this.login = "used";

        localStorage.setItem("ticket-user", JSON.stringify(storeResponseJson));
        //บอกว่าให้เปลี่ยนไปหน้า main
        return (this.pop_login = "hide"), (this.user_status = "logingin");
      }
    },
    async regis() {
      if (
        this.create_account_user == true &&
        this.create_account_user_info == true &&
        this.create_account_pass == true &&
        this.create_account_email == true &&
        this.create_account_email_info == true &&
        this.create_account_name == true &&
        this.create_account_sur == true &&
        this.create_account_gender == true &&
        this.create_account_phone == true &&
        this.create_account_birth == true &&
        this.create_account_address == true &&
        this.create_account_postal == true
      ) {
        const bodyForm = {
          firstName: this.account_name,
          lastName: this.account_sur,
          username: this.account_user,
          email: this.account_email,
          password: this.account_pass,
          gender: this.account_gender,
          birthday: this.account_birth,
          phoneNumber: this.account_phone,
          address: this.account_address,
          postcode: this.account_postal,
        };

        await fetch("http://localhost:3000/auth/register", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(bodyForm),
        });

        this.login = "used";
      } else {
        alert("กรุณาใส่ข้อมูล");
      }
    },

    buy() {
      if (this.user_status === "anonymous") {
        this.pop_login = "show";
      } else {
        window.location.href = "zone-1.html";
      }
    },
    genqr(pathqr) {
      return (this.qrcode =
        "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=" +
        pathqr);
    },
  },
  watch: {
    searchName(newvalue) {
      this.newData = this.allevents.filter((value) => {
        return value.name.toLowerCase().includes(newvalue.toLowerCase());
      });
    },
    account_user(newvalue) {
      //เช็คว่าพิมพ์ user เกิน 12 ตัว ไหม ถ้าเกิน status ขึ้น false
      if (newvalue.length > 12) {
        return (this.create_account_user = false);
      } else {
        this.account_user = newvalue;
        if (this.account_user.length < 1) {
          return (this.create_account_user = false);
        } else {
          this.create_account_user = true;
          if (this.account_user == this.info[0].user) {
            return (this.create_account_user_info = false);
          } else {
            return (this.create_account_user_info = true);
          }
        }
      }
    },
    account_pass(newvalue) {
      //เช็คว่าพิมพ์ pass ถึง 9 ตัว ไหม ถ้าไม่ status ขึ้น false
      if (newvalue.length < 9) {
        return (this.create_account_pass = false);
      } else {
        this.account_pass = newvalue;
        if (this.account_pass.length < 1) {
          return (this.create_account_pass = false);
        } else {
          return (this.create_account_pass = true);
        }
      }
    },

    account_email(newvalue) {
      //เช็คว่าพิมพ์ email ไหม
      if (newvalue.length < 1) {
        return (this.create_account_email = false);
      } else {
        this.account_email = newvalue;
        if (this.account_email.length < 1) {
          return (this.create_account_email = false);
        } else {
          this.create_account_email = true;
          if (this.account_email == this.info[0].email) {
            return (this.create_account_email_info = false);
          } else {
            return (this.create_account_email_info = true);
          }
        }
      }
    },

    account_name(newvalue) {
      //เช็คว่าพิมพ์ name ไหม
      if (newvalue.length < 1) {
        return (this.create_account_name = false);
      } else {
        this.account_name = newvalue;
        if (this.account_name.length < 1) {
          return (this.create_account_name = false);
        } else {
          return (this.create_account_name = true);
        }
      }
    },

    account_sur(newvalue) {
      //เช็คว่าพิมพ์ surname ไหม
      if (newvalue.length < 1) {
        return (this.create_account_sur = false);
      } else {
        this.account_sur = newvalue;
        if (this.account_sur.length < 1) {
          return (this.create_account_sur = false);
        } else {
          return (this.create_account_sur = true);
        }
      }
    },

    account_gender(newvalue) {
      //เช็คว่าselect gender ไหม
      if (newvalue == "") {
        return (this.create_account_gender = false);
      } else {
        this.account_gender = newvalue;
        if (this.account_gender == "") {
          return (this.create_account_gender = false);
        } else {
          return (this.create_account_gender = true);
        }
      }
    },

    account_birth(newvalue) {
      //เช็คว่าselect birth ไหม
      if (newvalue == "") {
        return (this.create_account_birth = false);
      } else {
        this.account_birth = newvalue;
        if (this.account_birth == "") {
          return (this.create_account_birth = false);
        } else {
          return (this.create_account_birth = true);
        }
      }
    },
    account_phone(newvalue) {
      //เช็คว่าพิมพ์ phone ไหม
      if (newvalue.length < 10) {
        return (this.create_account_phone = false);
      } else {
        this.account_phone = newvalue;
        if (this.account_phone.length > 10) {
          return (this.create_account_phone = false);
        } else {
          return (this.create_account_phone = true);
        }
      }
    },

    account_address(newvalue) {
      //เช็คว่าพิมพ์ address ไหม
      if (newvalue.length < 50) {
        return (this.create_account_address = false);
      } else {
        this.account_address = newvalue;
        if (this.account_address.length < 1) {
          return (this.create_account_address = false);
        } else {
          return (this.create_account_address = true);
        }
      }
    },

    account_postal(newvalue) {
      //เช็คว่าพิมพ์ postal ไหม
      if (newvalue.length < 5) {
        return (this.create_account_postal = false);
      } else {
        this.account_postal = newvalue;
        if (this.account_postal.length > 5) {
          return (this.create_account_postal = false);
        } else {
          return (this.create_account_postal = true);
        }
      }
    },
  },
};
</script>

<style scoped>
/* @import "../assets/css/seat.css";
@import "../assets/css/nav.css";
@import "../assets/css/navbar_buy.css"; */

</style>
