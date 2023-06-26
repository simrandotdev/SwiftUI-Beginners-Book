import Foundation

var likeCount: Double = 5
var commentCount: Double = 1
var viewCount: Double = 100

likeCount += 1

if likeCount == 5 {
    print("Post has 5 likes")
} else {
    print("Post does NOT have 5 likes.")
}

if likeCount != 5 {
    print("Post does NOT have 5 likes.")
}

if likeCount > 5 {
    print("Post has greater than 5 likes")
}

if (likeCount > 3) && (commentCount > 0) {
    print("Post has greater than 3 likes AND greater then 0 comments")
}

if (likeCount > 3) || (viewCount > 100) {
    print("Post has greater than 3 likes OR greater then 100 view counts")
}

