package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ValidateController {

    @GetMapping(value = "/validate")
    public ModelAndView validatePage() {
        ModelAndView mav = new ModelAndView("validate");

        return mav;
    }

    @PostMapping(value = "/cardscan")
    public ModelAndView validadeScan(@RequestParam("qrcode") String qrcode) {
        ModelAndView mav = new ModelAndView("validate");



        return mav;
    }
}
