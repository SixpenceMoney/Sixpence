import Quick
import Nimble


final class TheStoryOfHowISellTheApp: QuickSpec {
    override func spec() {

        it("enters a starting balance") {
            let howMuchToManage = NewUser<HowMuchToManageScreen>()
            
            howMuchToManage.opensApp()
        }
        
    }
}
