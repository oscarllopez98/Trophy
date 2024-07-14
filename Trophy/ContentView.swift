import SwiftUI

struct ContentView: View {
    @StateObject var exerciseCardListViewModel: ExerciseCardListViewModel
    @State private var isModalVisible = false
    var userId: String
    var username: String

    init(userId: String, username: String) {
        _exerciseCardListViewModel = StateObject(wrappedValue: ExerciseCardListViewModel(userId: userId))
        self.userId = userId
        self.username = username
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    UserProfileInfoView()
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                
                HStack {
                    ExerciseCardListView(viewModel: exerciseCardListViewModel)
                }
                .frame(height: geometry.size.height * 0.80)
                .padding(.horizontal)
                
                GeometryReader { actionBarGeo in
                    HStack {
                        NavigationBar()
//                        ActionBarView(isModalVisible: $isModalVisible, exerciseListViewModel: exerciseListViewModel, userId: userId)
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .onTapGesture {
//                                isModalVisible.toggle()
//                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .alert(item: $exerciseListViewModel.errorMessage) { error in
//            Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
//        }
//        .sheet(isPresented: $isModalVisible) {
//            NewExerciseModalView(viewModel: NewExerciseModalViewModel(exerciseListViewModel: exerciseListViewModel, userId: userId), isModalVisible: $isModalVisible)
//        }
    }
}


#Preview {
    let userId: String = getEnvironmentVariable("TEST_USER_ID")!
    let sampleUsername = "Test User"
    return ContentView(userId: userId, username: sampleUsername).previewLayout(.sizeThatFits)
}
