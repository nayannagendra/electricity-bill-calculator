
package electricitybill;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Controller
public class ElectricityBillController {

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @PostMapping("/calculate")
    public String calculate(
            @RequestParam(required = false) String units,
            Model model) {

        model.addAttribute("units", units);

        try {
            if (units == null || units.trim().isEmpty()) {
                throw new IllegalArgumentException(
                        "Please enter electricity units.");
            }

            int u = Integer.parseInt(units.trim());

            if (u < 0) {
                throw new IllegalArgumentException(
                        "Units cannot be negative.");
            }

            double bill;

            if (u <= 50) {
                bill = u * 3.50;
            } else if (u <= 150) {
                bill = 50 * 3.50 + (u - 50) * 4.00;
            } else if (u <= 250) {
                bill = 50 * 3.50 + 100 * 4.00
                        + (u - 150) * 5.20;
            } else {
                bill = 50 * 3.50 + 100 * 4.00
                        + 100 * 5.20 + (u - 250) * 6.50;
            }

            model.addAttribute("bill",
                    BigDecimal.valueOf(bill)
                            .setScale(2, RoundingMode.HALF_UP));

        } catch (NumberFormatException e) {
            model.addAttribute("error",
                    "Please enter a valid whole number.");
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
        }

        return "index";
    }
}
