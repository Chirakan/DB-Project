<template>
  <div class="style_main_contrainer">
    <nav>
      <div class="whatsthisnavbarhavenaa">
        <router-link to="/">
          <div class="circle"></div>
        </router-link>
        <div class="void"></div>
        <a href="">
          <div class="circle" v-show="user_status == 'logingin'">A</div>
        </a>
        <button
          class="btn_login"
          @click="pop_login = 'show'"
          v-show="user_status == 'anonymous'"
        >
          เข้าสู่ระบบ
        </button>
      </div>

      <div
        class="pop_login"
        v-show="pop_login == 'show'"
        v-bind:class="[login == 'yet' ? 'register' : '']"
      >
        <div  @click="pop_login = 'hide'">
          <i class="fas fa-times" style="cursor:pointer; color:white;"></i>
        </div>

        <div class="pop_login_havewhat">
          <div v-show="login == 'used'">
            <h3>เข้าสู่ระบบ</h3>
            <form>
              <input
                type="text"
                placeholder="ชื่อผู้ใช้"
                v-model="username"
                required
              />

              <br />

              <input
                type="text"
                placeholder="รหัสผ่าน"
                v-model="password"
                required
              />
              <br />
            </form>
            <button class="btn_login" v-on:click="loginnn()">
              เข้าสู่ระบบ
            </button>
            <h4 @click="login = 'yet'">สมัครสมาชิก</h4>
          </div>
          <div v-show="login == 'yet'">
            <h3>สมัครสมาชิก</h3>
            <form>
              <input
                type="text"
                placeholder="อีเมลล์"
                v-model="account_email"
                required
              />
              <p class="textp" v-show="create_account_email == false">
                โปรดระบุอีเมล
              </p>
              <p class="textp" v-show="create_account_email_info == false">
                อีเมลนี้เคยลงทะเบียนแล้ว
              </p>

              <input
                type="text"
                placeholder="ชื่อผู้ใช้"
                v-model="account_user"
                required
              />
              <p class="textp" v-show="create_account_user == false">
                username ต้องอยู่ระหว่าง 1 - 12 ตัวอักษร
              </p>
              <p class="textp" v-show="create_account_user_info == false">
                username มีคนใช้งานแล้ว
              </p>

              <input
                type="text"
                placeholder="รหัสผ่าน"
                v-model="account_pass"
                required
              />
              <p class="textp" v-show="create_account_pass == false">
                password ต้องมีไม่ต่ำกว่า 9 ตัวอักษร
              </p>
              <input type="text" placeholder="ชื่อ" v-model="account_name" />
              <p class="textp" v-show="create_account_name == false">
                โปรดระบุชื่อ
              </p>
              <br />
              <input type="text" placeholder="นามสกุล" v-model="account_sur" />
              <p class="textp" v-show="create_account_sur == false">
                โปรดระบุนามสกุล
              </p>
              <br />
              <select name="gender" id="gender" v-model="account_gender">
                <option value>โปรดเลือกเพศ</option>
                <option value="female">หญิง</option>
                <option value="male">ชาย</option>
                <option value="none">ไม่ระบุ</option>
              </select>

              <br />
              <p class="textp" v-show="create_account_gender == false">
                โปรดระบุเพศ
              </p>

              <input
                type="date"
                name="birthday"
                id="birthday"
                v-model="account_birth"
              />
              <p class="textp" v-show="create_account_birth == false">
                โปรดระบุวันเกิด
              </p>

              <br />
              <input
                type="text"
                placeholder="เบอร์โทรศัพท์"
                v-model="account_phone"
              />
              <p class="textp" v-show="create_account_phone == false">
                โปรดระบุเบอร์โทร
              </p>
              <br />

              <input
                type="textarea"
                placeholder="ที่อยู่"
                v-model="account_address"
              />
              <p class="textp" v-show="create_account_address == false">
                ที่อยู่ ต้องมีไม่ต่ำกว่า 50 ตัวอักษร
              </p>
              <br />
              <input
                type="text"
                placeholder="รหัสไปรษณีย์"
                v-model="account_postal"
              />
              <p class="textp" v-show="create_account_postal == false">
                โปรดระบุรหัสไปรษณีย์
              </p>
              <br />
            </form>
            <button class="btn_login" @click="regis()">สมัครสมาชิก</button>
            <h4 @click="login = 'used'">มีบัญชีผู้ใช้อยู่แล้ว</h4>
          </div>
        </div>
      </div>
    </nav>
    <div class="carousel">
      <!-- <div class="carousel" v-for="events in allevents" :key="events.id"> -->
      <!-- <div class="carousel" v-if="events.carousel === 'true'"> -->
      <iframe
        class="ccc"
        width="100%"
        height="80%"
        src="https://www.youtube.com/embed/6Ia6PLUZbCg?autoplay=1&mute=1"
        title="YouTube video player"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
        allowfullscreen
      ></iframe>
      <div class="framepic_carousel">
        <img class="poster_carousel" :src="allevents[6].poster" alt="" />
      </div>
      <div>
        <div class="detailc">
          <div class="namec">
            <h3>{{ allevents[6].name }}</h3>
          </div>
          <div class="datec">
            <p>{{ allevents[6].date }}</p>
          </div>
          <div class="locationc">
            <i class="fa fa-map-marker" aria-hidden="true"></i>
            <h4>{{ allevents[6].hall }}</h4>
          </div>
          <p>{{ allevents[6].description }}</p>
        </div>
      </div>
      <!-- </div> -->
    </div>

    <div class="cate">
      <div>
        <h3
          class="allBtn"
          v-bind:class="[page == 'all' ? 'allcancomselecting' : '']"
          v-on:click="page = 'all'"
        >
          ทุกการแสดง
        </h3>
      </div>
      <h3
        class="canbuyBtn"
        v-bind:class="[page == 'now' ? 'allcancomselecting' : '']"
        v-on:click="page = 'now'"
      >
        ซื้อบัตร
      </h3>
      <h3
        class="comingBtn"
        v-bind:class="[page == 'soon' ? 'allcancomselecting' : '']"
        v-on:click="page = 'soon'"
      >
        เร็วๆนี้
      </h3>
      <div class="filterfunc">
        <i class="fas fa-search"></i>
        <input type="text" class="filter" v-model="searchName" />
      </div>
    </div>

    <hr />
    <div class="all_concert all_e" v-show="page == 'all'">
      <div v-for="events in newData" :key="events.id">
        <div class="style_main_card">
          <div class="framepic">
            <img class="poster" :src="events.poster" />
          </div>
          <div class="detail">
            <div class="name">
              <h3>{{ events.name }}</h3>
            </div>
            <div class="date">
              <p>{{ events.date }}</p>
            </div>
            <div class="location">
              <i class="fas fa-map-marker-alt"></i>
              <h4>{{ events.hall }}</h4>
            </div>
          </div>
          <router-link to="/blog/detail">
            <!-- <a href="detail.html"> -->
            <div class="button_canbuy">
              <h3>ซื้อบัตร</h3>
            </div>
            <!-- </a> -->
          </router-link>
        </div>
      </div>
    </div>
    <div class="all_concert canbuy" v-show="page == 'now'">
      <div v-for="events in newData" :key="events.id">
        <div v-if="events.status === 'now'">
          <div class="style_main_card">
            <div class="framepic">
              <img class="poster" :src="events.poster" />
            </div>
            <div class="detail">
              <div class="name">
                <h3>{{ events.name }}</h3>
              </div>
              <div class="date">
                <p>{{ events.date }}</p>
              </div>
              <div class="location">
                <i class="fas fa-map-marker-alt"></i>
                <h4>{{ events.hall }}</h4>
              </div>
            </div>
            <router-link to="/blog/detail">
              <!-- <a href="detail.html"> -->
              <div class="button_canbuy">
                <h3>ซื้อบัตร</h3>
              </div>
              <!-- </a> -->
            </router-link>
            <!-- <a href="detail.html">
              <div class="button_canbuy">
                <h3>ซื้อบัตร</h3>
              </div>
            </a> -->
          </div>
        </div>
      </div>
    </div>
    <div class="all_concert coming" v-show="page == 'soon'">
      <div v-for="events in newData" :key="events.id">
        <div v-if="events.status === 'soon'">
          <div class="style_main_card">
            <div class="framepic">
              <img class="poster" :src="events.poster" />
            </div>
            <div class="detail">
              <div class="name">
                <h3>{{ events.name }}</h3>
              </div>
              <div class="date">
                <p>{{ events.date }}</p>
              </div>
              <div class="location">
                <i class="fas fa-map-marker-alt"></i>
                <h4>{{ events.hall }}</h4>
              </div>
            </div>
            <router-link to="/blog/detail">
              <!-- <a href="detail.html"> -->
              <div class="button_canbuy">
                <h3>ซื้อบัตร</h3>
              </div>
              <!-- </a> -->
            </router-link>
          </div>
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

</style>
