var allEventComponent = new Vue({
  el: "#allEventComponent",
  data: {
    statuslog: true,
    user: "Manee",
    email: "นกแก้ว@กินองุ่น.คอม",
    phone: "012345678",
    dis: "../img/profile.png",
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

    add_edit:"edited",
    
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
    account_phone: '',
    create_account_phone: true,
    account_birth: '',
    create_account_birth: true,
    account_address: '',
    create_account_address: true,
    account_postal: '',
    create_account_postal: true,

    qrcode: '',
    pathqr: 'hellowelcome', 

    info: [
      {
        user: "manee",
        pass: "1234",
        email: "123456@"
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
        poster: "../img/poster_01.jpg",
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
        poster: "../img/poster_02.jpg",
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
        poster: "../img/poster_03.jpg",
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
        poster: "../img/poster_04.png",
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
        poster: "../img/poster_05.jpg",
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
        poster: "../img/poster_06.jpg",
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
        poster: "../img/poster_07.jpg",
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
        poster: "../img/poster_01.jpg",
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
        poster: "../img/poster_02.jpg",
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
        poster: "../img/poster_03.jpg",
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
        poster: "../img/poster_04.png",
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
        poster: "../img/poster_05.jpg",
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
        poster: "../img/poster_06.jpg",
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
        poster: "../img/poster_07.jpg",
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
    ]
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
      ){
        return (this.login = 'used')
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
    genqr(pathqr){
      return qrcode = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data='+pathqr
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
          this.create_account_user = true
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
      } else{
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
          this.create_account_email = true
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
      if (newvalue == '') {
        return (this.create_account_gender = false);
      } else {
        this.account_gender = newvalue;
        if (this.account_gender == '') {
          return (this.create_account_gender = false);
        } else {
          return (this.create_account_gender = true);
        }
      }
    },

    account_birth(newvalue) {
      //เช็คว่าselect birth ไหม
      if (newvalue == '') {
        return (this.create_account_birth = false);
      } else {
        this.account_birth = newvalue;
        if (this.account_birth == '') {
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
});
