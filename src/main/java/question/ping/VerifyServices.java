package question.ping;

import net.serenitybdd.rest.SerenityRest;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Question;
import net.serenitybdd.screenplay.ensure.Ensure;

import static util.Contants.MESSAGE_VERIFY_SERVICE;

public class VerifyServices implements Question<Boolean> {

    public VerifyServices() {
    }
    String response;
    public static VerifyServices verifyServices() {
        return new VerifyServices();
    }

    @Override
    public Boolean answeredBy(Actor actor) {
        response= SerenityRest.lastResponse().asString();
        actor.attemptsTo(Ensure.that(response).contains(MESSAGE_VERIFY_SERVICE));
        return response.contains(MESSAGE_VERIFY_SERVICE);
    }
}

