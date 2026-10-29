import SwiftUI

@main
struct DatePickerReproApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

struct ContentView: View {
  var body: some View {
    NavigationStack {
      List {
        NavigationLink("Open date screen") {
          DateScreen()
        }
      }
      .navigationTitle("Home")
    }
  }
}

struct DateScreen: View {
  // In en_US, "May 31, 2024" is wider than the width the compact picker gets on its first layout,
  // and "Jan 1, 2026" is narrower.
  @State private var wideDate = Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 31))!
  @State private var narrowDate = Calendar.current.date(from: DateComponents(year: 2026, month: 1, day: 1))!

  var body: some View {
    List {
      DateRow(title: "May 31, 2024", date: $wideDate)
      DateRow(title: "Jan 1, 2026", date: $narrowDate)
    }
    .navigationTitle("Date")
  }
}

struct DateRow: View {
  let title: String
  @Binding var date: Date

  var body: some View {
    HStack {
      Text(title)
      Spacer()
      DatePicker(title, selection: $date, displayedComponents: .date)
        .labelsHidden()
    }
  }
}
