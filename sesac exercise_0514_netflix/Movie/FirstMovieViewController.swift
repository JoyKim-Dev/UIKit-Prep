//
//  FirstMovieViewController.swift
//  sesac exercise_0514_netflix
//
//  Created by Joy Kim on 5/16/24.
//

import UIKit

class FirstMovieViewController: UIViewController {
    
    // 영화 포스터 이미지뷰 객체 아웃렛 변수 연결
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    @IBOutlet var fourthImageView: UIImageView!
    
    // 탑텐 마크 이미지뷰 객체 아웃렛 변수 연결
    @IBOutlet var firstMovieMarkImageView: UIImageView!
    @IBOutlet var secondMovieMarkImageView: UIImageView!
    @IBOutlet var thirdMovieMarkImageView: UIImageView!
    
    
    // 영화 포스터 이미지 배열 생성
    let movie = ["노량", "아바타물의길", "오펜하이머"]
    
    // 탑텐 마크 이미지 배열 생성
    let movieMark = ["top10 badge","single-badge","wordmark"]
    
    // 탑텐 마크 보여줄지 말지 불리언 배열 생성
    let show = [true, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 영화 포스터 이미지뷰 모서리 둥글게
        firstImageView.layer.cornerRadius = 10
        secondImageView.layer.cornerRadius = 10
        thirdImageView.layer.cornerRadius = 10
        fourthImageView.layer.cornerRadius = 10
        
        // 영화 포스터 테두리 두께 설정
        firstImageView.layer.borderWidth = 2
        secondImageView.layer.borderWidth = 2
        thirdImageView.layer.borderWidth = 2
        fourthImageView.layer.borderWidth = 2
        
        // 영화 포스터 테두리 색상 설정
        firstImageView.layer.borderColor = UIColor.lightGray.cgColor
        secondImageView.layer.borderColor = UIColor.blue.cgColor
        thirdImageView.layer.borderColor = UIColor.gray.cgColor
        fourthImageView.layer.borderColor = UIColor.green.cgColor
        
        
        // 탑텐 마크 숨김 상태 설정
        // * 탑텐 마크 랜덤
        firstMovieMarkImageView.isHidden = true
        secondMovieMarkImageView.isHidden = true
        thirdMovieMarkImageView.isHidden = true
        
        
        
    }
    
    
    @IBAction func playBtnTapped(_ sender: UIButton) {
        // 버튼 누르면 영화 포스터 랜덤 변경
        firstImageView.image = UIImage(named: movie[Int.random(in: 0...2)])
        // 버튼 누르면 탑텐 마크 달아줄지 말지 랜덤 지정
        firstMovieMarkImageView.isHidden = show[Int.random(in: 0...1)]
        // 버튼 누르면 탑텐 마크 이미지 랜덤 지정
        firstMovieMarkImageView.image = UIImage(named: movieMark[Int.random(in: 0...2)])
        
        secondImageView.image = UIImage(named: movie[Int.random(in: 0...2)])
        secondMovieMarkImageView.image = UIImage(named: movieMark[Int.random(in: 0...2)])
        secondMovieMarkImageView.isHidden = show[Int.random(in: 0...1)]
        
        thirdImageView.image = UIImage(named: movie[Int.random(in: 0...2)])
        thirdMovieMarkImageView.image = UIImage(named: movieMark[Int.random(in: 0...2)])
        thirdMovieMarkImageView.isHidden = show[Int.random(in: 0...1)]
        
        fourthImageView.image = UIImage(named: movie[Int.random(in: 0...2)])
        
        
    }
    
  
    
}
