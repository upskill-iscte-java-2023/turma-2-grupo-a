package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.models.Contact;
import pt.upskill.vias.services.auth.EmailService;
@Controller
public class EmailController {

    @Autowired
    private EmailService emailService;
    @GetMapping(value = "/contacts")
    public ModelAndView contactPage() {
        return new ModelAndView("/email/contacts");
    }

    @PostMapping(value= "/send_message")
    public ModelAndView sendMessageAction(Contact contact) {
        String emailContent = "<html><body>" + "<p>Pedido de Contacto por: " +  contact.getName() + " | " + contact.getEmail() + "</p><p>" + contact.getText() + "</p>";
        emailService.sendEmail("the.vias.app@gmail.com", "Pedido de contacto", emailContent);
        return new ModelAndView("/email/contact_success");

    }

}

