"""
Author: Sovunh Voeu, Pascal Lluberes
Professor: Seikyung Jung
Class:Comp 405-001

Project: GUI
Description:
Instead of web we decided to program a GUI that eseentially adds and drops values.
"""
import sqlite3
import tkinter as tk
from tkinter import ttk
from tkinter import messagebox


""" This function will fetch the data from our SQLite Database"""
def fetch_data():
    try:
        conn = sqlite3.connect('finalprojectSP_schema2.db')
        cursor = conn.cursor()
        cursor.execute("select * from games;")
        rows = cursor.fetchall()
        update_treeview(rows)
        conn.close()
    except Exception as e:
        messagebox.showerror("Error", f"An error has occurred: {e}")


""" Our Function to update the Treeview widget """
def update_treeview(data):
    for item in tree.get_children():
        tree.delete(item)
    for row in data:
        tree.insert("", tk.END, values=row)


""" Our Function to add new data within the selected table """
def add_data():
   new_value = entry.get()
   if not new_value:
       messagebox.showerror("Error", "Please enter a value")
       return
   try:
       conn = sqlite3.connect('finalprojectSP_schema2.db')
       cursor = conn.cursor()
       cursor.execute("insert into games (name) values (?)", (new_value,))
       conn.commit()
       conn.close()
       fetch_data()
   except Exception as e:
       messagebox.showerror("Error", f"An error occurred: {e}")


""" Our Function to deletes new data within the selected table """
def delete_data():
    selected_item = tree.selection()
    if not selected_item:
        messagebox.showerror("Error", "Please select a row to delete.")
        return
    selected_id = tree.item(selected_item, "values")[1]
    try:
        conn = sqlite3.connect('finalprojectSP_schema2.db')
        cursor = conn.cursor()
        cursor.execute("delete from games where name = ?", (selected_id,))
        conn.commit()
        conn.close()
        fetch_data()
    except Exception as e:
        messagebox.showerror("Error", f"An error occurred while deleting: {e}")


""" The GUI setup itself """
root = tk.Tk()
root.title("SQLite GUI")

frame = tk.Frame(root)
frame.pack(pady=20)

""" Creates the Entry and Add Button """
entry = tk.Entry(frame, width=30)
entry.grid(row=0, column=0, padx=10)
add_button = tk.Button(frame, text="Add", command=add_data)
add_button.grid(row=0, column=1, padx=10)

""" Creates the Delete Button """
delete_button = tk.Button(frame, text="Delete", command=delete_data)
delete_button.grid(row=1, column=1, padx=10)

""" Treeview to display our data """
columns = ("id", "name")
tree = ttk.Treeview(root, columns=columns, show="headings")
tree.heading("id", text="ID")
tree.heading("name", text="Name")
tree.pack(pady=20)

""" Fetches and displays our data"""
fetch_data()
root.mainloop()