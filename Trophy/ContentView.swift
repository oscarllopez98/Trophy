//import SwiftUI

//struct ContentView: View {
//    @StateObject var exerciseCardListViewModel: ExerciseCardListViewModel
//    @State private var isModalVisible = false
//    var userId: String
//    var username: String
//
//    init(userId: String, username: String) {
//        _exerciseCardListViewModel = StateObject(wrappedValue: ExerciseCardListViewModel(userId: userId))
//        self.userId = userId
//        self.username = username
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                HStack {
//                    UserProfileInfoView()
//                }
//                .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
//                
//                HStack {
//                    ExerciseCardListView(viewModel: exerciseCardListViewModel)
//                }
//                .frame(height: geometry.size.height * 0.80)
//                .padding(.horizontal)
//                
//                GeometryReader { actionBarGeo in
//                    HStack {
//                        NavigationBar(userId: userId, username: username)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                }
//                .frame(maxWidth: .infinity)
//            }
//            .frame(width: geometry.size.width, height: geometry.size.height)
//        }
//    }
//}
//
//
//#Preview {
//    let userId: String = getEnvironmentVariable("TEST_USER_ID")!
//    let sampleUsername = "Test User"
//    return ContentView(userId: userId, username: sampleUsername).previewLayout(.sizeThatFits)
//}
