package chinh.anh.controller;

import chinh.anh.model.Customer;
import chinh.anh.service.CustomerServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = {"/","customer"})
public class CustomerController {
    private CustomerServiceImpl customerService = new CustomerServiceImpl();

    @GetMapping
    public String hello(HttpServletRequest request) {
        List<Customer> customers = customerService.findAll();
        request.setAttribute("customers", customers);
        return "/customers/list";
    }

    @GetMapping("/create")
    public String createForm() {
        return "/customers/create";
    }

    @PostMapping
    public String create(HttpServletRequest request) {
        int id = customerService.findAll().size()+1;
        String name = request.getParameter("name");

        String email = request.getParameter("email");

        String address = request.getParameter("address");

//        int id = (int)Math.random()*10000;
//        int id_ = Integer.parseInt(id);
        Customer customer = new Customer(id, name, email, address);
        this.customerService.save(customer);
        request.setAttribute("message", "New customer was created");
        return "/customers/create";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable int id, HttpServletRequest request) {
        System.out.println("detail");
        System.out.println("id" + id);
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        return "/customers/detail";
    }

    @RequestMapping("/edit/{id}")
    public String getFormEdit(@PathVariable int id, HttpServletRequest request) {
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        System.out.println("name --> " + request.getParameter("name"));
        if (name == null || email == null || address == null) {
            request.setAttribute("message", "Update Information");
            return "/customers/edit";
        } else {
            if (name.isEmpty() || email.isEmpty() || address.isEmpty()) {
                System.out.println("name es" + name);
                request.setAttribute("message", "A field is required! Please fill in the form!");
                return "/customers/edit";
            }
        }
        Customer customer1 = new Customer(id, name, email, address);
        this.customerService.save(customer1);
        request.setAttribute("message", "Update Success!");

        return "/customers/edit";
    }
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable int id){
//        Customer customer = customerService.findById(id);
        customerService.delete(id);
        return "/customers/delete";
    }
}
