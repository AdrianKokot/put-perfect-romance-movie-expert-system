import tkinter
import customtkinter

customtkinter.set_appearance_mode("light")
customtkinter.set_default_color_theme("blue")

data = [{"question": "Question 1", "answers": ["Answer 1", "Answer 2", "Answer 3"]},
        {"question": "Question 2", "answers": ["Answer 1", "Answer 2", "Answer 3"]}]


class App(customtkinter.CTk):
    def setup_question(self, question):
        if self.question_label is not None:
            self.question_label.destroy()

        self.question_label = customtkinter.CTkLabel(master=self, text=question)
        self.question_label.grid(row=0, column=0, columnspan=3, padx=20, pady=20, sticky="ew")

    def __init__(self):
        super().__init__()

        self.title("Perfect romance movie")
        self.iconbitmap("./icon.ico")

        self.minsize(800, 300)
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure((0, 1, 2), weight=1)

        self.question_label = None
        self.checkboxes = []
        self.answers = customtkinter.CTkFrame(master=self)
        self.answers.grid_rowconfigure(0, weight=1)
        self.answers.grid_columnconfigure(0, weight=1)
        self.answers.grid(row=1, column=0, columnspan=3, padx=20, pady=20, sticky="ew")
        self.answers.configure()
        self.selected_checkbox = tkinter.IntVar()
        self.question_count = 0

        self.next_button = customtkinter.CTkButton(master=self, command=self.next_button_callback, text="Next")
        self.next_button.grid(row=3, column=1, padx=20, pady=20, sticky="ew")

        self.setup_question(data[0].get("question"))
        self.setup_answers(data[0].get("answers"))

    def checkbox_selected(self):
        self.next_button.configure(state="standard")

    def setup_answers(self, answers):
        self.next_button.configure(state="disabled")
        self.selected_checkbox.set(-1)

        for i in range(len(self.checkboxes)):
            self.checkboxes[i].destroy()

        for i in range(len(answers)):
            self.checkboxes.append(
                customtkinter.CTkRadioButton(master=self.answers, text=answers[i], value=i,
                                             variable=self.selected_checkbox, command=self.checkbox_selected)
            )
            self.checkboxes[-1].grid(row=i, column=0, pady=(0, 10), padx=10, sticky="new")

        self.checkboxes[-len(answers)].grid(pady=10)

    def next_button_callback(self):
        self.question_count += 1

        if self.question_count < len(data):
            self.setup_question(data[self.question_count].get("question"))
            self.setup_answers(data[self.question_count].get("answers"))
        else:
            self.next_button.destroy()
            self.answers.destroy()
            self.setup_question("Result!!")


if __name__ == "__main__":
    app = App()
    app.mainloop()
