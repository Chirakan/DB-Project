<template>
  <div class="contrainer">
    <nav>
      <div class="whatsthisnavbarhavenaa">
        <a href="main.html">
          <div class="circle"></div>
        </a>
        <div class="void"></div>
        <a href="profile.html">
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
        <div class="btn" @click="pop_login = 'hide'">
          <i class="fas fa-times"></i>
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
            <button class="btn btn_login" v-on:click="loginnn()">
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
                <option value="">โปรดเลือกเพศ</option>
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
            <button class="btn btn_login" @click="regis()">สมัครสมาชิก</button>
            <h4 @click="login = 'used'">มีบัญชีผู้ใช้อยู่แล้ว</h4>
          </div>
        </div>
      </div>
    </nav>

    <div class="event-billboard">
      <div class="bg clear">
        <img :src="allevents[0].poster" alt="" class="background" />
      </div>
      <div class="content container">
        <div class="row justify-content-center">
          <div class="col-12 col-md col-img">
            <div class="box-img">
              <img :src="allevents[0].poster" alt="" class="poster" />
            </div>
          </div>
          <div class="col-12 col-md">
            <div class="box-txt">
              <div class="row">
                <div class="col-12">
                  <h1 class="title">{{ allevents[0].name }}</h1>
                </div>
              </div>
              <div class="row row-detail">
                <div class="col-12 col-md">
                  <ul class="event-detail-list">
                    <li class="item">
                      <i class="fa fa-calendar-o"></i>
                      <small> วันที่แสดง</small>
                      <p class="txt">
                        <span>{{ allevents[0].date }}</span>
                      </p>
                    </li>
                    <li class="item">
                      <i class="fas fa-map-marker-alt"></i>
                      <small> สถานที่แสดง</small>
                      <p class="txt">
                        <span>{{ allevents[0].hall }}</span>
                      </p>
                    </li>
                    <li class="item">
                      <i class="fa fa-clock-o"></i> 
                      <small> ประตูเปิด</small>
                      <p class="txt">
                        <span>-</span>
                      </p>
                    </li>
                  </ul>
                </div>
                <div class="col-12 col-md-6 col-overlay">
                  <ul class="event-detail-list">
                    <li class="item">
                      <i class="fa fa-calendar-o"></i>
                      <small> วัน Pre Sale</small>
                      <p class="txt">
                        <span>วันอาทิตย์ที่ 2 เมษายน 2566, 10:00 น.</span>
                      </p>
                    </li>
                    <li class="item">
                      <i class="fa fa-money"></i>
                      <small> ราคาบัตร</small>
                      <p class="txt">
                        <span>{{ allevents[0].price }}</span>
                      </p>
                    </li>
                    <li class="item">
                      <i class="fa fa-ticket"></i>
                      <small> Ticket Status</small>
                      <p class="txt">
                        <span class="">
                          <span class="ticket-status">{{
                            allevents[0].status
                          }}</span></span
                        >
                      </p>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="box_container">
      <div class="row_2">
        <div class="col-12 col-lg-8">
          <article class="event-detail">
            <section class="section" id="section-event-round">
              <h2 class="head">รอบการแสดง</h2>
              <div class="body">
                <!-- EVENT ROUND -->
                <div class="event-detail-item">
                  <div class="box-event-list">
                    <div class="head">
                      <div class="row_2">
                        <div class="col-label col-6">
                          <small>วันที่แสดง</small>
                        </div>
                        <div class="col-btn col-6"><small>เวลา</small></div>
                      </div>
                    </div>
                    <div class="body">
                      <div class="row_2">
                        <div class="col-label">
                          <div class="date">วันอาทิตย์ที่ 4 มิถุนายน 2566</div>
                        </div>
                        <div class="col-btn" v-show="allevents[0].status === 'now'" @click="buy()">
                          <span class="btn-item">
                            <a
                              class="button"
                              style="background-color: #b40000; cursor: pointer"
                            >
                              <span class="item-show">19:00</span>
                            </a>
                          </span>
                        </div>
                        <div
                          class="col-btn"
                          v-show="
                            allevents[0].status === 'out' || status === 'soon'
                          "
                        >
                          <span class="btn-item">
                            <a
                              class="button"
                              href=""
                              style="
                                background-color: #9e9e9e;
                                cursor: not-allowed;
                              "
                            >
                              <span class="item-show">19:00</span>
                            </a>
                          </span>
                        </div>
                      </div>
                      <div class="row_2">
                        <div class="col-label">
                          <div class="date">วันอาทิตย์ที่ 4 มิถุนายน 2566</div>
                        </div>
                        <div
                          class="col-btn"
                          v-show="allevents[0].status === 'now'"
                          @click="buy()"
                        >
                          <span class="btn-item">
                            <a
                              class="button"
                              style="background-color: #b40000; cursor: pointer"
                            >
                              <span class="item-show">19:00</span>
                            </a>
                          </span>
                        </div>
                        <div
                          class="col-btn"
                          v-show="
                            allevents[0].status === 'out' || status === 'soon'
                          "
                        >
                          <span class="btn-item">
                            <a
                              class="button"
                              href=""
                              style="
                                background-color: #9e9e9e;
                                cursor: not-allowed;
                              "
                            >
                              <span class="item-show">19:00</span>
                            </a>
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- / EVENT ROUND  -->
              </div>
            </section>

            <section class="section detail">
              <h2 class="head">รายละเอียด</h2>
              <div class="body">
                <div style="text-align: center">
                  <div>
                    <span class="text_detail" style="font-size: 18px"
                      ><strong>{{ allevents[0].description }}</strong></span
                    >
                  </div>
                </div>
              </div>
            </section>
          </article>
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
        // this.pop_login = "show";
        this.$router.push('/blog/zone-1')
      } else {
        this.$router.push('/blog/zone-1')
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

<style scoped src="">
@import "../assets/css/detail.css";
@import "../assets/css/nav.css";
@import "../assets/css/style_main.css";
</style>
