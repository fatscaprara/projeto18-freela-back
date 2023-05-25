export async function getTicketById(req, res) {
  try {
    const { ticket } = req;

    res.send(ticket);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}
