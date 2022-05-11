import Foundation

/*
init(매개변수 : 타입, ...){
 // 프로퍼티 초기화
 // 인스턴스 생성시 필요한 설정을 해주는 코드 작성
 }
 */

class User {
    var nickname : String
    var age : Int
    
    init(nickname : String, age: Int){
        self.nickname = nickname
        self.age = age
    }
    
    init(age: Int){
        self.nickname = "ablert"
        self.age = age
    }
}

var user = User(nickname:"gunter", age:23)
user.nickname
user.age

var user2 = User(age:27)
user2.nickname
user2.age
