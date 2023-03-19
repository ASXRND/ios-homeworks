//
//  PhotoGallery.swift
//  Navigation
//
//  Created by Александр on 25.02.2023.
//

import UIKit

struct PhotoGallery {
    var image: String

    static func setupImage() -> [PhotoGallery] {
        var image = [PhotoGallery]()

        image.append(PhotoGallery(image: "Amber Laura Heard"))
        image.append(PhotoGallery(image: "Anastasia Alekseevna Terekhova"))
        image.append(PhotoGallery(image: "Anna Vyalitsyna"))
        image.append(PhotoGallery(image: "Avril Ramona Lavigne"))
        image.append(PhotoGallery(image: "Blake Lively"))
        image.append(PhotoGallery(image: "Cameron Michelle Diaz"))
        image.append(PhotoGallery(image: "Charlize Theron"))
        image.append(PhotoGallery(image: "Ekaterina Vilkova"))
        image.append(PhotoGallery(image: "Emma Charlotte Duerre Watson"))
        image.append(PhotoGallery(image: "Hayden Lesley Panettiere"))
        image.append(PhotoGallery(image: "Hilary Erhard Duff"))
        image.append(PhotoGallery(image: "Irina Shayk"))
        image.append(PhotoGallery(image: "Isabella Khairiah Hadid"))
        image.append(PhotoGallery(image: "Jennifer Lynn Affleck"))
        image.append(PhotoGallery(image: "Karina Razumovskaya"))
        image.append(PhotoGallery(image: "Kimberley Alexis Bledel"))
        image.append(PhotoGallery(image: "Kimberly Noel Kardashian"))
        image.append(PhotoGallery(image: "Kristen Jaymes Stewart"))
        image.append(PhotoGallery(image: "Ksenia Sukhinova"))
        image.append(PhotoGallery(image: "Linda Evangelista"))

        return image
    }
}



//struct PhotoGallery {
//
//    static func setupGallery() -> [ImageGallery] {
//        [
//            .init(id: 1, imageName: "Amber Laura Heard"),
//            .init(id: 2, imageName: "Anastasia Alekseevna Terekhova"),
//            .init(id: 3, imageName: "Anna Vyalitsyna"),
//            .init(id: 4, imageName: "Avril Ramona Lavigne"),
//            .init(id: 5, imageName: "Blake Lively"),
//            .init(id: 6, imageName: "Cameron Michelle Diaz"),
//            .init(id: 7, imageName: "Charlize Theron"),
//            .init(id: 8, imageName: "Ekaterina Vilkova"),
//            .init(id: 9, imageName: "Emma Charlotte Duerre Watson"),
//            .init(id: 10, imageName: "Hayden Lesley Panettiere"),
//            .init(id: 11, imageName: "Hilary Erhard Duff"),
//            .init(id: 12, imageName: "Irina Shayk"),
//            .init(id: 13, imageName: "Isabella Khairiah Hadid"),
//            .init(id: 14, imageName: "Jennifer Lynn Affleck"),
//            .init(id: 15, imageName: "Karina Razumovskaya"),
//            .init(id: 16, imageName: "Kimberley Alexis Bledel"),
//            .init(id: 17, imageName: "Kimberly Noel Kardashian"),
//            .init(id: 18, imageName: "Kristen Jaymes Stewart"),
//            .init(id: 19, imageName: "Ksenia Sukhinova"),
//            .init(id: 20, imageName: "Linda Evangelista"),
//        ]
//    }
//
//    static func randomPhotos(with count: Int) -> [ImageGallery] {
//        return (0..<count).map { _ in setupGallery().randomElement()! }
//    }
//}
//
//struct ImageGallery {
//    let id: Int
//    let imageName: String
//}
//
//struct SectionPhoto {
//    let sectionName: String
//    var photos: [ImageGallery]
//}
