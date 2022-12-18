import tkinter
import customtkinter
import clips

customtkinter.set_appearance_mode("light")
customtkinter.set_default_color_theme("blue")


class ExpertSystem:
    def __init__(self):
        self.env = clips.Environment()
        self.env.load('movies.clp')

    def get_facts(self):
        return self.env.facts()

    def set_answer(self, answer_string):
        self.env.assert_string("(odpowiedz \"" + answer_string + "\")")

    def run(self):
        self.env.run()


class App(customtkinter.CTk):
    def show_question(self, question):
        if self.question_label is None:
            self.question_label = customtkinter.CTkLabel(master=self, text=question)
            self.question_label.grid(row=0, column=0, columnspan=3, padx=20, pady=20, sticky="ew")

        self.question_label.configure(text=question)

    def load_expert_system_data(self):
        self.env.run()

        for fact in self.env.get_facts():
            if fact.template.name == "pytanie":
                self.question_string = fact[0]
                self.answers_list = [fact[x + 1] for x in range(len(fact) - 1)]

                self.show_question(self.question_string)
                self.show_answers(self.answers_list)

            if fact.template.name == "wynik":
                self.finish(fact[0])

    def __init__(self):
        super().__init__()

        self.title("Perfect romance movie")
        self.iconbitmap("./icon.ico")

        self.minsize(800, 300)
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure((0, 1, 2), weight=1)

        self.env = ExpertSystem()

        self.question_label = None
        self.question_string = ""
        self.answers_list = []
        self.checkboxes = []
        self.answers = customtkinter.CTkFrame(master=self)
        self.answers.grid_rowconfigure(0, weight=1)
        self.answers.grid_columnconfigure(0, weight=1)
        self.answers.grid(row=1, column=0, columnspan=3, padx=20, pady=20, sticky="ew")
        self.answers.configure()
        self.selected_checkbox = tkinter.IntVar()

        self.next_button = customtkinter.CTkButton(master=self, command=self.next_button_callback, text="Next")
        self.next_button.grid(row=3, column=1, padx=20, pady=20, sticky="ew")

        self.load_expert_system_data()

    def checkbox_selected(self):
        self.next_button.configure(state="standard")

    def show_answers(self, answers):
        self.next_button.configure(state="disabled")
        self.selected_checkbox.set(-1)

        for checkbox in self.checkboxes:
            checkbox.grid_forget()
            checkbox.destroy()

        self.checkboxes = []

        for i in range(len(answers)):
            self.checkboxes.append(
                customtkinter.CTkRadioButton(master=self.answers, text=answers[i], value=i,
                                             variable=self.selected_checkbox, command=self.checkbox_selected)
            )
            self.checkboxes[-1].grid(row=i, column=0, pady=(0, 10), padx=10, sticky="new")

        self.checkboxes[0].grid(pady=10)

    def next_button_callback(self):
        self.env.set_answer(self.answers_list[self.selected_checkbox.get()])

        self.load_expert_system_data()

    def finish(self, result):
        self.next_button.destroy()
        self.answers.destroy()
        self.show_question(result)


if __name__ == "__main__":
    app = App()
    app.mainloop()
