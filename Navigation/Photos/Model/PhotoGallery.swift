//
//  PhotoGallery.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

struct PhotoGallery {

    static func setupGallery() -> [ImageGallery] {
        [
            .init(id: 1, imageName: "Amber Laura Heard"),
            .init(id: 2, imageName: "Anastasia Alekseevna Terekhova"),
            .init(id: 3, imageName: "Anna Vyalitsyna"),
            .init(id: 4, imageName: "Avril Ramona Lavigne"),
            .init(id: 5, imageName: "Blake Lively"),
            .init(id: 6, imageName: "Cameron Michelle Diaz"),
            .init(id: 7, imageName: "Charlize Theron"),
            .init(id: 8, imageName: "Ekaterina Vilkova"),
            .init(id: 9, imageName: "Emma Charlotte Duerre Watson"),
            .init(id: 10, imageName: "Hayden Lesley Panettiere"),
            .init(id: 11, imageName: "Hilary Erhard Duff"),
            .init(id: 12, imageName: "Irina Shayk"),
            .init(id: 13, imageName: "Isabella Khairiah Hadid"),
            .init(id: 14, imageName: "Jennifer Lynn Affleck"),
            .init(id: 15, imageName: "Karina Razumovskaya"),
            .init(id: 16, imageName: "Kimberley Alexis Bledel"),
            .init(id: 17, imageName: "Kimberly Noel Kardashian"),
            .init(id: 18, imageName: "Kristen Jaymes Stewart"),
            .init(id: 19, imageName: "Ksenia Sukhinova"),
            .init(id: 20, imageName: "Linda Evangelista"),
            .init(id: 21, imageName: "Margot Elise Robbie"),
            .init(id: 22, imageName: "Milla Jovovich"),
            .init(id: 23, imageName: "Natalie Portman"),
            .init(id: 24, imageName: "Natalya Vodyanova"),
            .init(id: 25, imageName: "Nathalie Kelley"),
            .init(id: 26, imageName: "Nina Dobrev"),
            .init(id: 27, imageName: "Oksana Fedorova"),
            .init(id: 28, imageName: "Olivia Jane Cockburn"),
            .init(id: 29, imageName: "Paulina Andreeva"),
            .init(id: 30, imageName: "Polina Gagarina"),
            .init(id: 31, imageName: "Robyn Rihanna Fenty"),
            .init(id: 32, imageName: "Sasha Luss"),
            .init(id: 33, imageName: "Taylor Alison Swift")
        ]
    }

    static func randomPhotos(with count: Int) -> [ImageGallery] {
        return (0..<count).map { _ in setupGallery().randomElement()! }
    }
}

struct ImageGallery {
    let id: Int
    let imageName: String
}

struct SectionPhoto {
    let sectionName: String
    var photos: [ImageGallery]
}
