package tests;

import com.intuit.karate.junit4.Karate;
import cucumber.api.java.en.When;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
public class TestRunner {
    @When("^Do Something here$")
    public void doSomethingHere() {
        System.out.println("Hello wrld");
    }


}
