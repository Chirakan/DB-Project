<template>
  <div id="allEventComponent">
    <nav>
      <div class="whatsthisnavbarhavenaa">
        <a href="main.html">
          <div class="circle"></div>
        </a>
        <div class="menu">
          <a href="main.html" class="nav-color"> หน้าแรก</a>
          <span>&nbsp;&nbsp;&nbsp;&gt;</span>
          <a href="zone-1.html" class="nav-color"> &nbsp; เลือกรอบการแสดง</a>
          <span>&nbsp;&nbsp;&nbsp;&gt;</span>
          <a style="color: #eee; cursor: context-menu"> &nbsp; การสั่งซื้อ </a>
        </div>
        <div class="void"></div>
        <a href="profile.html">
          <div class="circle">A</div>
        </a>
      </div>
    </nav>
    <div id="contrainer">
      <div id="zone-box">
        <div class="stage">STAGE</div>
        <div id="zone-stand">
          <a href="seat.html">
            <div class="K1">K1 [standing]</div>
          </a>
          <a href="seat.html">
            <div class="K2">K2 [standing]</div>
          </a>
        </div>
        <div id="zone-seat-all">
          <a href="seat.html">
            <div id="zone-seat" class="zone-A">
              <div class="A"></div>
              <div class="A">ZONE A</div>
              <div class="A"></div>
            </div>
          </a>
          <a href="seat.html">
            <div id="zone-seat" class="zone-B">
              <div class="B"></div>
              <div class="B">ZONE B</div>
              <div class="B"></div>
            </div>
          </a>
          <a href="seat.html">
            <div id="zone-seat" class="zone-C">
              <div class="C"></div>
              <div class="C">ZONE C</div>
              <div class="C"></div>
            </div>
          </a>
        </div>
      </div>
      <div id="rate">
        <h3>{{ allevents[0].name }}</h3>
        <div class="line"></div>
        <div class="date-seat">
          <select id="date">
            <option value="0">เลือกรอบการแสดง</option>
            <option value="1">Sat 27 May 2023 19.00</option>
            <option value="2">Sun 28 May 2023 19.00</option>
          </select>
          <button id="seat-sn" class="seat-sn" @click="pop_seat = 'show'">
            ที่นั่งว่าง
          </button>
          <div id="Mypopup" class="popup" v-show="pop_seat == 'show'">
            <div class="popup-zone">
              <span class="close" @click="pop_seat = 'hide'">&times;</span>
              <p>โซนที่นั่ง</p>
              <table class="zone-other">
                <tr>
                  <th>โซนที่นั่ง</th>
                  <th>ที่นั่งว่าง</th>
                </tr>
                <tr>
                  <td>K1</td>
                  <td>{{ seat_empty }}</td>
                </tr>
                <tr>
                  <td>K2</td>
                  <td>{{ seat_empty }}</td>
                </tr>
                <tr>
                  <td>ZONE A</td>
                  <td>{{ seat_empty }}</td>
                </tr>
                <tr>
                  <td>ZONE B</td>
                  <td>{{ seat_empty }}</td>
                </tr>
                <tr>
                  <td>ZONE C</td>
                  <td>{{ seat_empty }}</td>
                </tr>
              </table>
              <button class="btn-change" @click="refreshmodal()">
                โหลดใหม่
              </button>
            </div>
          </div>
        </div>
        <div id="price">
          <div class="stand"></div>
          <div class="price-stand">6,000 THB</div>
          <div class="seat-A"></div>
          <div class="price-A">4,500 THB</div>
          <div class="seat-B"></div>
          <div class="price-B">2,500 THB</div>
          <div class="seat-C"></div>
          <div class="price-C">1,500 THB</div>
        </div>
      </div>
    </div>
    <footer>
      <div class="textfooter">
        <h2>King Mongkut's Institute of Technology Ladkrabang</h2>
        <h3>School of Infomation Technology</h3>
        <h4>DATABASE SYSTEM CONCEPT</h4>
      </div>
    </footer>
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

      pop_seat: "hide",

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
    loginnn() {
      //เช็คว่า user กับ pass ที่กรอกมาตรงกับข้อมูลที่ตรงไหม
      if (
        this.username == this.info[0].user &&
        this.password == this.info[0].pass
      ) {
        console.log(this.username);
        //บอกว่าให้เปลี่ยนไปหน้า main
        return (this.pop_login = "hide"), (this.user_status = "logingin");
        //ถ้าไม่กรอก
      } else if (this.username == "" && this.password == "") {
        alert("กรุณาใส่ข้อมูล");
      } else {
        //ถ้า user ผิด
        alert("username หรือ password ผิด");
      }
    },
    regis() {
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
        return (this.login = "used");
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
    refreshmodal() {
      location.reload();
    }
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

<style scoped src="">
@import "../assets/css/zone-1.css";
@import "../assets/css/nav.css";
@import "../assets/css/navbar_buy.css";
</style>
